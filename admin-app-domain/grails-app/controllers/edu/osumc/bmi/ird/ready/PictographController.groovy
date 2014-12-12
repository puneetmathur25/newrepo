package edu.osumc.bmi.ird.ready



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PictographController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pictograph.list(params), model:[pictographInstanceCount: Pictograph.count()]
    }

    def show(Pictograph pictographInstance) {
        respond pictographInstance
    }

    def create() {
        respond new Pictograph(params)
    }

    @Transactional
    def save(Pictograph pictographInstance) {
        if (pictographInstance == null) {
            notFound()
            return
        }

        if (pictographInstance.hasErrors()) {
            respond pictographInstance.errors, view:'create'
            return
        }

        pictographInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pictograph.label', default: 'Pictograph'), pictographInstance.id])
                redirect pictographInstance
            }
            '*' { respond pictographInstance, [status: CREATED] }
        }
    }

    def edit(Pictograph pictographInstance) {
        respond pictographInstance
    }

    @Transactional
    def update(Pictograph pictographInstance) {
        if (pictographInstance == null) {
            notFound()
            return
        }

        if (pictographInstance.hasErrors()) {
            respond pictographInstance.errors, view:'edit'
            return
        }

        pictographInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pictograph.label', default: 'Pictograph'), pictographInstance.id])
                redirect pictographInstance
            }
            '*'{ respond pictographInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Pictograph pictographInstance) {

        if (pictographInstance == null) {
            notFound()
            return
        }

        pictographInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pictograph.label', default: 'Pictograph'), pictographInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pictograph.label', default: 'Pictograph'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
