package edu.osumc.bmi.ird.ready



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InstrumentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Instrument.list(params), model:[instrumentInstanceCount: Instrument.count()]
    }

    def show(Instrument instrumentInstance) {
        respond instrumentInstance
    }

    def create() {
        respond new Instrument(params)
    }

    @Transactional
    def save(Instrument instrumentInstance) {
        if (instrumentInstance == null) {
            notFound()
            return
        }

        if (instrumentInstance.hasErrors()) {
            respond instrumentInstance.errors, view:'create'
            return
        }

        instrumentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'instrument.label', default: 'Instrument'), instrumentInstance.id])
                redirect instrumentInstance
            }
            '*' { respond instrumentInstance, [status: CREATED] }
        }
    }

    def edit(Instrument instrumentInstance) {
        respond instrumentInstance
    }

    @Transactional
    def update(Instrument instrumentInstance) {
        if (instrumentInstance == null) {
            notFound()
            return
        }

        if (instrumentInstance.hasErrors()) {
            respond instrumentInstance.errors, view:'edit'
            return
        }

        instrumentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Instrument.label', default: 'Instrument'), instrumentInstance.id])
                redirect instrumentInstance
            }
            '*'{ respond instrumentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Instrument instrumentInstance) {

        if (instrumentInstance == null) {
            notFound()
            return
        }

        instrumentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Instrument.label', default: 'Instrument'), instrumentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'instrument.label', default: 'Instrument'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
