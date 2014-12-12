package edu.osumc.bmi.ird.ready



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResponseOptionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ResponseOption.list(params), model:[responseOptionInstanceCount: ResponseOption.count()]
    }

    def show(ResponseOption responseOptionInstance) {
        respond responseOptionInstance
    }

    def create() {
        respond new ResponseOption(params)
    }

    @Transactional
    def save(ResponseOption responseOptionInstance) {
        if (responseOptionInstance == null) {
            notFound()
            return
        }

        if (responseOptionInstance.hasErrors()) {
            respond responseOptionInstance.errors, view:'create'
            return
        }

        responseOptionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'responseOption.label', default: 'ResponseOption'), responseOptionInstance.id])
                redirect responseOptionInstance
            }
            '*' { respond responseOptionInstance, [status: CREATED] }
        }
    }

    def edit(ResponseOption responseOptionInstance) {
        respond responseOptionInstance
    }

    @Transactional
    def update(ResponseOption responseOptionInstance) {
        if (responseOptionInstance == null) {
            notFound()
            return
        }

        if (responseOptionInstance.hasErrors()) {
            respond responseOptionInstance.errors, view:'edit'
            return
        }

        responseOptionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ResponseOption.label', default: 'ResponseOption'), responseOptionInstance.id])
                redirect responseOptionInstance
            }
            '*'{ respond responseOptionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ResponseOption responseOptionInstance) {

        if (responseOptionInstance == null) {
            notFound()
            return
        }

        responseOptionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ResponseOption.label', default: 'ResponseOption'), responseOptionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'responseOption.label', default: 'ResponseOption'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
