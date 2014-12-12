package edu.osumc.bmi.ird.ready



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MDPageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MDPages.list(params), model:[MDPagesInstanceCount: MDPages.count()]
    }

    def show(MDPage MDPagesInstance) {
        respond MDPagesInstance
    }

    def create() {
        respond new MDPages(params)
    }

    @Transactional
    def save(MDPage MDPagesInstance) {
        if (MDPagesInstance == null) {
            notFound()
            return
        }

        if (MDPagesInstance.hasErrors()) {
            respond MDPagesInstance.errors, view:'create'
            return
        }

        MDPagesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'MDPages.label', default: 'MDPages'), MDPagesInstance.id])
                redirect MDPagesInstance
            }
            '*' { respond MDPagesInstance, [status: CREATED] }
        }
    }

    def edit(MDPage MDPagesInstance) {
        respond MDPagesInstance
    }

    @Transactional
    def update(MDPage MDPagesInstance) {
        if (MDPagesInstance == null) {
            notFound()
            return
        }

        if (MDPagesInstance.hasErrors()) {
            respond MDPagesInstance.errors, view:'edit'
            return
        }

        MDPagesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MDPages.label', default: 'MDPages'), MDPagesInstance.id])
                redirect MDPagesInstance
            }
            '*'{ respond MDPagesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MDPage MDPagesInstance) {

        if (MDPagesInstance == null) {
            notFound()
            return
        }

        MDPagesInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MDPages.label', default: 'MDPages'), MDPagesInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'MDPages.label', default: 'MDPages'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
