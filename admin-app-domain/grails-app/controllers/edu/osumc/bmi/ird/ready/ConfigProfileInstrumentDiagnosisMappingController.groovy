package edu.osumc.bmi.ird.ready



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ConfigProfileInstrumentDiagnosisMappingController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConfigProfileInstrumentDiagnosisMapping.list(params), model:[configProfileInstrumentDiagnosisMappingInstanceCount: ConfigProfileInstrumentDiagnosisMapping.count()]
    }

    def show(ConfigProfileInstrumentDiagnosisMapping configProfileInstrumentDiagnosisMappingInstance) {
        respond configProfileInstrumentDiagnosisMappingInstance
    }

    def create() {
        respond new ConfigProfileInstrumentDiagnosisMapping(params)
    }

    @Transactional
    def save(ConfigProfileInstrumentDiagnosisMapping configProfileInstrumentDiagnosisMappingInstance) {
        if (configProfileInstrumentDiagnosisMappingInstance == null) {
            notFound()
            return
        }

        if (configProfileInstrumentDiagnosisMappingInstance.hasErrors()) {
            respond configProfileInstrumentDiagnosisMappingInstance.errors, view:'create'
            return
        }

        configProfileInstrumentDiagnosisMappingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'configProfileInstrumentDiagnosisMapping.label', default: 'ConfigProfileInstrumentDiagnosisMapping'), configProfileInstrumentDiagnosisMappingInstance.id])
                redirect configProfileInstrumentDiagnosisMappingInstance
            }
            '*' { respond configProfileInstrumentDiagnosisMappingInstance, [status: CREATED] }
        }
    }

    def edit(ConfigProfileInstrumentDiagnosisMapping configProfileInstrumentDiagnosisMappingInstance) {
        respond configProfileInstrumentDiagnosisMappingInstance
    }

    @Transactional
    def update(ConfigProfileInstrumentDiagnosisMapping configProfileInstrumentDiagnosisMappingInstance) {
        if (configProfileInstrumentDiagnosisMappingInstance == null) {
            notFound()
            return
        }

        if (configProfileInstrumentDiagnosisMappingInstance.hasErrors()) {
            respond configProfileInstrumentDiagnosisMappingInstance.errors, view:'edit'
            return
        }

        configProfileInstrumentDiagnosisMappingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConfigProfileInstrumentDiagnosisMapping.label', default: 'ConfigProfileInstrumentDiagnosisMapping'), configProfileInstrumentDiagnosisMappingInstance.id])
                redirect configProfileInstrumentDiagnosisMappingInstance
            }
            '*'{ respond configProfileInstrumentDiagnosisMappingInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConfigProfileInstrumentDiagnosisMapping configProfileInstrumentDiagnosisMappingInstance) {

        if (configProfileInstrumentDiagnosisMappingInstance == null) {
            notFound()
            return
        }

        configProfileInstrumentDiagnosisMappingInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConfigProfileInstrumentDiagnosisMapping.label', default: 'ConfigProfileInstrumentDiagnosisMapping'), configProfileInstrumentDiagnosisMappingInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'configProfileInstrumentDiagnosisMapping.label', default: 'ConfigProfileInstrumentDiagnosisMapping'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
