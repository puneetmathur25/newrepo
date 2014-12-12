package edu.osumc.bmi.ird.ready



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SiteConfigProfileMappingController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SiteConfigProfileMapping.list(params), model:[siteConfigProfileMappingInstanceCount: SiteConfigProfileMapping.count()]
    }

    def show(SiteConfigProfileMapping siteConfigProfileMappingInstance) {
        respond siteConfigProfileMappingInstance
    }

    def create() {
        respond new SiteConfigProfileMapping(params)
    }

    @Transactional
    def save(SiteConfigProfileMapping siteConfigProfileMappingInstance) {
        if (siteConfigProfileMappingInstance == null) {
            notFound()
            return
        }

        if (siteConfigProfileMappingInstance.hasErrors()) {
            respond siteConfigProfileMappingInstance.errors, view:'create'
            return
        }

        siteConfigProfileMappingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'siteConfigProfileMapping.label', default: 'SiteConfigProfileMapping'), siteConfigProfileMappingInstance.id])
                redirect siteConfigProfileMappingInstance
            }
            '*' { respond siteConfigProfileMappingInstance, [status: CREATED] }
        }
    }

    def edit(SiteConfigProfileMapping siteConfigProfileMappingInstance) {
        respond siteConfigProfileMappingInstance
    }

    @Transactional
    def update(SiteConfigProfileMapping siteConfigProfileMappingInstance) {
        if (siteConfigProfileMappingInstance == null) {
            notFound()
            return
        }

        if (siteConfigProfileMappingInstance.hasErrors()) {
            respond siteConfigProfileMappingInstance.errors, view:'edit'
            return
        }

        siteConfigProfileMappingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SiteConfigProfileMapping.label', default: 'SiteConfigProfileMapping'), siteConfigProfileMappingInstance.id])
                redirect siteConfigProfileMappingInstance
            }
            '*'{ respond siteConfigProfileMappingInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SiteConfigProfileMapping siteConfigProfileMappingInstance) {

        if (siteConfigProfileMappingInstance == null) {
            notFound()
            return
        }

        siteConfigProfileMappingInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SiteConfigProfileMapping.label', default: 'SiteConfigProfileMapping'), siteConfigProfileMappingInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteConfigProfileMapping.label', default: 'SiteConfigProfileMapping'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
