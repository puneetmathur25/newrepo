package edu.osumc.bmi.ird.ready



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PhysicianController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Physician.list(params), model:[physicianInstanceCount: Physician.count()]
    }

    def show(Physician physicianInstance) {
        respond physicianInstance
    }

    def create() {
        respond new Physician(params)
    }

    @Transactional
    def save(Physician physicianInstance) {
        if (physicianInstance == null) {
            notFound()
            return
        }

        if (physicianInstance.hasErrors()) {
            respond physicianInstance.errors, view:'create'
            return
        }

        physicianInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'physician.label', default: 'Physician'), physicianInstance.id])
                redirect physicianInstance
            }
            '*' { respond physicianInstance, [status: CREATED] }
        }
    }

    def edit(Physician physicianInstance) {
        respond physicianInstance
    }

    @Transactional
    def update(Physician physicianInstance) {
        if (physicianInstance == null) {
            notFound()
            return
        }

        if (physicianInstance.hasErrors()) {
            respond physicianInstance.errors, view:'edit'
            return
        }

        physicianInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Physician.label', default: 'Physician'), physicianInstance.id])
                redirect physicianInstance
            }
            '*'{ respond physicianInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Physician physicianInstance) {

        if (physicianInstance == null) {
            notFound()
            return
        }

        physicianInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Physician.label', default: 'Physician'), physicianInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'physician.label', default: 'Physician'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
