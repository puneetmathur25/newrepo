package edu.osumc.bmi.ird.ready



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResponseTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ResponseType.list(params), model:[responseTypeInstanceCount: ResponseType.count()]
    }

    def show(ResponseType responseTypeInstance) {
        respond responseTypeInstance
    }

    def create() {
        respond new ResponseType(params)
    }

    @Transactional
    def save(ResponseType responseTypeInstance) {
        if (responseTypeInstance == null) {
            notFound()
            return
        }

        if (responseTypeInstance.hasErrors()) {
            respond responseTypeInstance.errors, view:'create'
            return
        }

        responseTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'responseType.label', default: 'ResponseType'), responseTypeInstance.id])
                redirect responseTypeInstance
            }
            '*' { respond responseTypeInstance, [status: CREATED] }
        }
    }

    def edit(ResponseType responseTypeInstance) {
        respond responseTypeInstance
    }

    @Transactional
    def update(ResponseType responseTypeInstance) {
        if (responseTypeInstance == null) {
            notFound()
            return
        }

        if (responseTypeInstance.hasErrors()) {
            respond responseTypeInstance.errors, view:'edit'
            return
        }

        responseTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ResponseType.label', default: 'ResponseType'), responseTypeInstance.id])
                redirect responseTypeInstance
            }
            '*'{ respond responseTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ResponseType responseTypeInstance) {

        if (responseTypeInstance == null) {
            notFound()
            return
        }

        responseTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ResponseType.label', default: 'ResponseType'), responseTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'responseType.label', default: 'ResponseType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
