package edu.osumc.bmi.ird.ready



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MDPageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MDPage.list(params), model:[MDPageInstanceCount: MDPage.count()]
    }

    def show(MDPage MDPageInstance) {
        respond MDPageInstance
    }

    def create() {
        respond new MDPage(params)
    }

    @Transactional
    def save(MDPage MDPageInstance) {
        if (MDPageInstance == null) {
            notFound()
            return
        }

        if (MDPageInstance.hasErrors()) {
            respond MDPageInstance.errors, view:'create'
            return
        }

        MDPageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'MDPage.label', default: 'MDPage'), MDPageInstance.id])
                redirect MDPageInstance
            }
            '*' { respond MDPageInstance, [status: CREATED] }
        }
    }

    def edit(MDPage MDPageInstance) {
        respond MDPageInstance
    }

    @Transactional
    def update(MDPage MDPageInstance) {
        if (MDPageInstance == null) {
            notFound()
            return
        }

        if (MDPageInstance.hasErrors()) {
            respond MDPageInstance.errors, view:'edit'
            return
        }

        MDPageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MDPage.label', default: 'MDPage'), MDPageInstance.id])
                redirect MDPageInstance
            }
            '*'{ respond MDPageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MDPage MDPageInstance) {

        if (MDPageInstance == null) {
            notFound()
            return
        }

        MDPageInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MDPage.label', default: 'MDPage'), MDPageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'MDPage.label', default: 'MDPage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
