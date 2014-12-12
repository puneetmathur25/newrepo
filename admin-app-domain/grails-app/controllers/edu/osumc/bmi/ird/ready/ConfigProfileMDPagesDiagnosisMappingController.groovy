package edu.osumc.bmi.ird.ready



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ConfigProfileMDPagesDiagnosisMappingController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConfigProfileMDPagesDiagnosisMapping.list(params), model:[configProfileMDPagesDiagnosisMappingInstanceCount: ConfigProfileMDPagesDiagnosisMapping.count()]
    }

    def show(ConfigProfileMDPagesDiagnosisMapping configProfileMDPagesDiagnosisMappingInstance) {
        respond configProfileMDPagesDiagnosisMappingInstance
    }

    def create() {
        respond new ConfigProfileMDPagesDiagnosisMapping(params)
    }

    @Transactional
    def save(ConfigProfileMDPagesDiagnosisMapping configProfileMDPagesDiagnosisMappingInstance) {
        if (configProfileMDPagesDiagnosisMappingInstance == null) {
            notFound()
            return
        }

        if (configProfileMDPagesDiagnosisMappingInstance.hasErrors()) {
            respond configProfileMDPagesDiagnosisMappingInstance.errors, view:'create'
            return
        }

        configProfileMDPagesDiagnosisMappingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'configProfileMDPagesDiagnosisMapping.label', default: 'ConfigProfileMDPagesDiagnosisMapping'), configProfileMDPagesDiagnosisMappingInstance.id])
                redirect configProfileMDPagesDiagnosisMappingInstance
            }
            '*' { respond configProfileMDPagesDiagnosisMappingInstance, [status: CREATED] }
        }
    }

    def edit(ConfigProfileMDPagesDiagnosisMapping configProfileMDPagesDiagnosisMappingInstance) {
        respond configProfileMDPagesDiagnosisMappingInstance
    }

    @Transactional
    def update(ConfigProfileMDPagesDiagnosisMapping configProfileMDPagesDiagnosisMappingInstance) {
        if (configProfileMDPagesDiagnosisMappingInstance == null) {
            notFound()
            return
        }

        if (configProfileMDPagesDiagnosisMappingInstance.hasErrors()) {
            respond configProfileMDPagesDiagnosisMappingInstance.errors, view:'edit'
            return
        }

        configProfileMDPagesDiagnosisMappingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ConfigProfileMDPagesDiagnosisMapping.label', default: 'ConfigProfileMDPagesDiagnosisMapping'), configProfileMDPagesDiagnosisMappingInstance.id])
                redirect configProfileMDPagesDiagnosisMappingInstance
            }
            '*'{ respond configProfileMDPagesDiagnosisMappingInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ConfigProfileMDPagesDiagnosisMapping configProfileMDPagesDiagnosisMappingInstance) {

        if (configProfileMDPagesDiagnosisMappingInstance == null) {
            notFound()
            return
        }

        configProfileMDPagesDiagnosisMappingInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ConfigProfileMDPagesDiagnosisMapping.label', default: 'ConfigProfileMDPagesDiagnosisMapping'), configProfileMDPagesDiagnosisMappingInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'configProfileMDPagesDiagnosisMapping.label', default: 'ConfigProfileMDPagesDiagnosisMapping'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
