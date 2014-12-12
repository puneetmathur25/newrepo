/* Copyright 2013 SpringSource.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package edu.osumc.bmi.ird.ready

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityUtils

import javax.servlet.http.HttpServletResponse

import org.springframework.security.access.annotation.Secured
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.context.SecurityContextHolder as SCH
import org.springframework.security.web.WebAttributes
import org.apache.commons.lang.RandomStringUtils
import org.codehaus.groovy.grails.web.mapping.LinkGenerator
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap;

import com.sun.org.apache.xalan.internal.xsltc.compiler.ForEach;

import grails.transaction.Transactional

@Secured('permitAll')
class LoginController {
    LinkGenerator grailsLinkGenerator
    /**
     * Dependency injection for the authenticationTrustResolver.
     */
    def authenticationTrustResolver

    /**
     * Dependency injection for the springSecurityService.
     */
    def springSecurityService
	
	/**
	 * Dependency injection for the searchableService.
	 */
	def searchableService

    /**
     * Default action; redirects to 'defaultTargetUrl' if logged in, /login/auth otherwise.
     */
    def index() {
        if (springSecurityService.isLoggedIn()) {
            redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
        } else {
            redirect action: 'auth', params: params
        }
    }

    /**
     * Show the login page.
     */
    def auth() {

        def config = SpringSecurityUtils.securityConfig

        if (springSecurityService.isLoggedIn()) {
            redirect uri: config.successHandler.defaultTargetUrl
            return
        }

        String view = 'auth'
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        render view: view, model: [postUrl            : postUrl,
                                   rememberMeParameter: config.rememberMe.parameter]
    }

    /**
     * The redirect action for Ajax requests.
     */
    def authAjax() {
        response.setHeader 'Location', SpringSecurityUtils.securityConfig.auth.ajaxLoginFormUrl
        response.sendError HttpServletResponse.SC_UNAUTHORIZED
    }

    /**
     * Show denied page.
     */
    def denied() {
        if (springSecurityService.isLoggedIn() &&
                authenticationTrustResolver.isRememberMe(SCH.context?.authentication)) {
            // have cookie but the page is guarded with IS_AUTHENTICATED_FULLY
            redirect action: 'full', params: params
        }
    }

    /**
     * Login page for users with a remember-me cookie but accessing a IS_AUTHENTICATED_FULLY page.
     */
    def full() {
        def config = SpringSecurityUtils.securityConfig
        render view: 'auth', params: params,
                model: [hasCookie: authenticationTrustResolver.isRememberMe(SCH.context?.authentication),
                        postUrl  : "${request.contextPath}${config.apf.filterProcessesUrl}"]
    }

    /**
     * Callback after a failed login. Redirects to the auth page with a warning message.
     */
    def authfail() {

        String msg = ''
        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
        if (exception) {
            if (exception instanceof AccountExpiredException) {
                msg = g.message(code: "springSecurity.errors.login.expired")
            } else if (exception instanceof CredentialsExpiredException) {
                msg = g.message(code: "springSecurity.errors.login.passwordExpired")
            } else if (exception instanceof DisabledException) {
                msg = g.message(code: "springSecurity.errors.login.disabled")
            } else if (exception instanceof LockedException) {
                msg = g.message(code: "springSecurity.errors.login.locked")
            } else {
                msg = g.message(code: "springSecurity.errors.login.fail")
            }
        }

        if (springSecurityService.isAjax(request)) {
            render([error: msg] as JSON)
        } else {
            flash.message = msg
            redirect action: 'auth', params: params
        }
    }

    /**
     * The Ajax success redirect url.
     */
    def ajaxSuccess() {
        render([success: true, username: springSecurityService.authentication.name] as JSON)
    }

    /**
     * The Ajax denied redirect url.
     */
    def ajaxDenied() {
        render([error: 'access denied'] as JSON)
    }

    //Methods

    def forgetPassword() {
        render(view: 'forgetPassword')
    }


    def newAccount() {
        render(view: 'register')
    }

    @Transactional
    def register(UserRegisterCommand cmd) {
        // uniqueness needs to be checked manually since command objects will not be persisted
        if (User.findByUsername(cmd.username) != null) {
            cmd.errors.rejectValue('username', 'default.not.unique.message', ['username', User.class.name, cmd.username
            ] as Object[], 'Username must be unique')
            render(view: 'register', model: [cmd: cmd])
            return
        }
        if (User.findByEmail(cmd.email) != null) {
            cmd.errors.rejectValue('email', 'default.not.unique.message', ['email', User.class.name,
                                                                           cmd.email] as Object[],
                    "Email must be unique")
            render(view: 'register', model: [cmd: cmd])
            return
        }
        if (!cmd.validate()) {
            render(view: 'register', model: [cmd: cmd])
            return
        }
		
		searchableService.stopMirroring()
        def user = cmd.registerUser()
		searchableService.startMirroring()
		
        if (user == null) {
            render(view: 'register', model: [cmd: cmd])
            return
        }
        sendMail {
            to user.email
            subject 'CIELO Registration'
            html generateConfirmMail(user.username, user.confirmId)

        }
        render(view: 'registered', model: [cmd: cmd])
    }

    def activation() {
        def cmd = params
        [cmd: cmd]
    }

    @Transactional
    def activate(UserActivateCommand cmd) {
        def user = null
        switch (request.method) {
            case 'POST':
                user = User.findByUsername(cmd.username)
                if (user == null) {
                    cmd.errors.reject('user.username.not.found', [cmd.username] as Object[], 'User not found')
                    redirect(action: 'activation', params: [cmd: cmd])
                    return
                }
                if (!springSecurityService.passwordEncoder.isPasswordValid(user.password, cmd.password, null)) {
                    cmd.errors.reject('user.password.not.match', [cmd.username] as Object[], 'Password not match')
                    redirect(action: 'activation', params: [cmd: cmd])
                    return
                }
                if (user.confirmId != cmd.confirmId) {
                    cmd.errors.reject('user.activate.code.not.found', [cmd.username, cmd.confirmId] as Object[],
                            'Confirmation code not match')
                    redirect(action: 'activation', params: [cmd: cmd])
                    return
                }

                if (cmd.activateUser(user) == null) {
                    redirect(action: 'activation', params: [cmd: cmd])
                    return
                }
                break;
            case 'GET':
                user = User.findByUsername(params.username)
                if (user == null) {
                    cmd.errors.reject('user.username.not.found', [params.username] as Object[], 'User not found')
                    redirect(action: 'activation', params: [cmd: cmd])
                    return
                }
                if (user.confirmId != params.confirmId) {
                    cmd.errors.reject('user.activate.code.not.found', [params.username, params.confirmId] as Object[],
                            'Confirmation code not match')
                    redirect(action: 'activation', params: [cmd: cmd])
                    return
                }
                if (cmd.activateUser(user) == null) {
                    redirect(action: 'activation', params: [cmd: cmd])
                    return
                }
                break;
            default:
                break;
        }
        [user: user]
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def changePassword() {}

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    @Transactional
    def updatePassword(PasswordCommand cmd) {
        if (!cmd.validate()) {
            render(view: 'changePassword', model: [cmd: cmd])
            return
        }
        def principal = springSecurityService.principal
        def user = User.get(principal.id)
        if (!springSecurityService.passwordEncoder.isPasswordValid(user.password, cmd.currentPassword, null)){
            render(view: 'changePassword', model: [cmd: cmd])
            return
        }
        user.password = cmd.password
        if (!user.save(flush: true)) {
            flash.message=message(code: 'user.password.change.unsuccessful')
            redirect(action: 'index')
        }
        flash.message=message(code: 'user.changePassword.success.message')
        redirect(action: 'index')
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def changeEmail() {}

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    @Transactional
    def updateEmail(EmailCommand cmd) {
        if (!cmd.validate()) {
            render(view: 'changeEmail', model: [cmd: cmd])
            return
        }
        def principal = springSecurityService.principal
        def user = User.get(principal.id)
        if (!springSecurityService.passwordEncoder.isPasswordValid(user.password, cmd.password, null)){
            flash.message=message(code: 'user.password.not.match')
            render(view: 'changeEmail', model: [cmd: cmd])
            return
        }
        if (user.email == cmd.email) {
            flash.message=message(code: 'email.not.change.message')
            redirect(action: 'index')
            return
        }
        user.email = cmd.email
        if (!user.save(flush: true)) {
            flash.message=message(code: 'user.password.change.unsuccessful')
            redirect(action: 'index')
            return
        }
        flash.message=message(code: 'email.change.message')
        redirect(action: 'index')
    }


    static public String generateConfirmId() {
        int randomStringLength = 16
        String charset = (('a'..'z') + ('A'..'Z') + ('0'..'9')).join()
        String randomString = RandomStringUtils.random(randomStringLength, charset.toCharArray())
        return randomString
    }

    private String generateConfirmMail(String username, String confirmId) {
        def params = [username: username, confirmId: confirmId]
        def activateLink = grailsLinkGenerator.link(absolute: true, controller: "login", action: "activation", params: params)
        def activateParamsLink = grailsLinkGenerator.link(absolute: true, controller: "login", action: "activate", params: params)
        String htmlBody = 'You have got this because this email address was used to register to CIELO, ' +
                'please click <a href="' + activateParamsLink + '"> here </a> to activate your account.' + '\n' +
                'If the link does not work please go to <a ' +
                'href="' + activateLink + '">here</a>, ' +
                'use your username with activate code: <b>' + confirmId + '</b> to confirm your registration.';
        return htmlBody
    }
}

class UserRegisterCommand {
    String username
    String password
    String confirmedPassword
    String email
    String firstName
    String lastName
    byte[] profilePic
    String profile
    Boolean agreement
	Institution institution

    static constraints = {
        importFrom User
        confirmedPassword blank: false, validator: { val, obj ->
            if (val != obj.password) {
                return ['match']
            }
        }
        agreement inList: [true]
    }

    User registerUser() {
        def user = new User()
        user.username = username
        user.password = password
        user.email = email
        user.firstName = firstName
        user.lastName = lastName
        user.profilePic = profilePic
        user.profile = profile
        user.enabled = false
        user.accountLocked = false
        user.accountExpired = false
        user.passwordExpired = false
		user.institution = institution
        user.confirmId = LoginController.generateConfirmId()
        if (!user.save(flush: true)) {
            this.errors = user.errors
            return null
        }
        return user
    }
}

class UserActivateCommand {
    String username
    String password
    String confirmId

    static constraints = {
        username blank: false
        password blank: false
        confirmId blank: false
    }

    User activateUser(User user) {
        user.enabled = true
        user.confirmId = null
        if (!user.save(flush: true)) {
            this.errors = user.errors
            return null
        }
        def userRole = SecRole.findByAuthority("ROLE_USER") ?: new SecRole(authority: 'ROLE_USER').save(flush: true)
        SecUserSecRole.create(user, userRole)
        return user
    }
}


class PasswordCommand {
    String currentPassword
    String password
    String confirmPassword

    static constraints = {
        currentPassword blank: false
        password blank: false
        confirmPassword blank: false, validator: {val, obj ->
            if (val != obj.password) {
                return 'user.password.not.match.message'
            }
        }
    }
}

class EmailCommand {
    String password
    String email

    static constraints = {
        email email: true, blank: false
    }
}


