<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="user.activate.title" args="[meta(name: 'app.name')]" /></title>
    <meta name="layout" content="login"/>
</head>

<body>
<div class="row">
    <g:if test="${flash.message}">
        <div class="alert alert-info alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            ${flash.message}
        </div>
    </g:if>
    <g:hasErrors bean="${cmd}">
        <ul class="errors" role="alert">
            <g:eachError bean="${cmd}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <div class="col-md-3"></div>
    <div class="col-md-6">
        <form id='register-confirm' class='form-horizontal' action='activate' method='POST'>
            <div class="form-group">
                <h3> <g:message code="user.activate.title" default="Activate the Account"/> </h3>
            </div>

            <div class="form-group">
                <label for='username' class="control-label"><g:message code="user.username.label"/>:</label>
                <div class="controls">
                    <input type='text' class='form-control col-md-4' name='username' id='username'
                           value="${cmd?.username}"/>
                </div>
            </div>

            <div class="form-group">
                <label for='password' class="control-label"><g:message code="user.password.label"
                                                                       default="Password"/>:</label>
                <div class="controls">
                    <input type='password' class='form-control col-md-4' name='password' id='password'/>
                </div>
            </div>

            <div class="form-group">
                <label for='confirmId' class="control-label"><g:message code="user.confirmId.label"
                                                                        default="Confirmation Code"/>:</label>
                <div class="controls">
                    <input type='text' class='form-control col-md-4' name='confirmId' id='confirmId'
                           value="${cmd?.confirmId}"/>
                </div>
            </div>

            <div class="form-group">
                <input type='submit' id="submit" class="btn btn-primary" value='Confirm'/>
            </div>
        </form>
    </div>
    <div class="col-md-3"></div>
</div>
</body>
</html>
