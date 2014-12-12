package edu.osumc.bmi.ird.ready



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ConfigProfileController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConfigProfile.list(params), model:[configProfileInstanceCount: ConfigProfile.count()]
    }

    def show(ConfigProfile configProfileInstance) {
        respond configProfileInstance
    }

    def create() {
        respond new ConfigProfile(params)
    }

    @Transactional
    def save(ConfigProfile configProfileInstance) {
        if (configProfileInstance == null) {
            notFound()
            return
        }

        if (configProfileInstance.hasErrors()) {
            respond configProfileInstance.errors, view:'create'
            return
        }

        configProfileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'configProfile.label', default: 'ConfigProfile'), configProfileInstance.id])
                redirect configProfileInstance
            }
            '*' { respond configProfileInstance, [status: CREATED] }
        }
    }

    def edit(ConfigProfile configProfileInstance) {
        respond configProfileInstance
    }

    @Transactional
    def update(ConfigProfile configProfileInstance) {
        if (configProfileInstance == null) {
            notFound()
            return
        }

        if (configProfileInstance.hasErrors()) {
            respond configProfileInstance.errors, view:'edit'
            return
        }

        configProfileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConfigProfile.label', default: 'ConfigProfile'), configProfileInstance.id])
                redirect configProfileInstance
            }
            '*'{ respond configProfileInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConfigProfile configProfileInstance) {

        if (configProfileInstance == null) {
            notFound()
            return
        }

        configProfileInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConfigProfile.label', default: 'ConfigProfile'), configProfileInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'configProfile.label', default: 'ConfigProfile'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
