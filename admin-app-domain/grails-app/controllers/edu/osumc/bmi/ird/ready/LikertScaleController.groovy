package edu.osumc.bmi.ird.ready



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LikertScaleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LikertScale.list(params), model:[likertScaleInstanceCount: LikertScale.count()]
    }

    def show(LikertScale likertScaleInstance) {
        respond likertScaleInstance
    }

    def create() {
        respond new LikertScale(params)
    }

    @Transactional
    def save(LikertScale likertScaleInstance) {
        if (likertScaleInstance == null) {
            notFound()
            return
        }

        if (likertScaleInstance.hasErrors()) {
            respond likertScaleInstance.errors, view:'create'
            return
        }

        likertScaleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'likertScale.label', default: 'LikertScale'), likertScaleInstance.id])
                redirect likertScaleInstance
            }
            '*' { respond likertScaleInstance, [status: CREATED] }
        }
    }

    def edit(LikertScale likertScaleInstance) {
        respond likertScaleInstance
    }

    @Transactional
    def update(LikertScale likertScaleInstance) {
        if (likertScaleInstance == null) {
            notFound()
            return
        }

        if (likertScaleInstance.hasErrors()) {
            respond likertScaleInstance.errors, view:'edit'
            return
        }

        likertScaleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LikertScale.label', default: 'LikertScale'), likertScaleInstance.id])
                redirect likertScaleInstance
            }
            '*'{ respond likertScaleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LikertScale likertScaleInstance) {

        if (likertScaleInstance == null) {
            notFound()
            return
        }

        likertScaleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LikertScale.label', default: 'LikertScale'), likertScaleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'likertScale.label', default: 'LikertScale'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
