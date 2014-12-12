package edu.osumc.bmi.ird.ready



import grails.test.mixin.*
import spock.lang.*

@TestFor(SiteConfigProfileMappingController)
@Mock(SiteConfigProfileMapping)
class SiteConfigProfileMappingControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.siteConfigProfileMappingInstanceList
            model.siteConfigProfileMappingInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.siteConfigProfileMappingInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def siteConfigProfileMapping = new SiteConfigProfileMapping()
            siteConfigProfileMapping.validate()
            controller.save(siteConfigProfileMapping)

        then:"The create view is rendered again with the correct model"
            model.siteConfigProfileMappingInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            siteConfigProfileMapping = new SiteConfigProfileMapping(params)

            controller.save(siteConfigProfileMapping)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/siteConfigProfileMapping/show/1'
            controller.flash.message != null
            SiteConfigProfileMapping.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def siteConfigProfileMapping = new SiteConfigProfileMapping(params)
            controller.show(siteConfigProfileMapping)

        then:"A model is populated containing the domain instance"
            model.siteConfigProfileMappingInstance == siteConfigProfileMapping
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def siteConfigProfileMapping = new SiteConfigProfileMapping(params)
            controller.edit(siteConfigProfileMapping)

        then:"A model is populated containing the domain instance"
            model.siteConfigProfileMappingInstance == siteConfigProfileMapping
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/siteConfigProfileMapping/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def siteConfigProfileMapping = new SiteConfigProfileMapping()
            siteConfigProfileMapping.validate()
            controller.update(siteConfigProfileMapping)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.siteConfigProfileMappingInstance == siteConfigProfileMapping

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            siteConfigProfileMapping = new SiteConfigProfileMapping(params).save(flush: true)
            controller.update(siteConfigProfileMapping)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/siteConfigProfileMapping/show/$siteConfigProfileMapping.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/siteConfigProfileMapping/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def siteConfigProfileMapping = new SiteConfigProfileMapping(params).save(flush: true)

        then:"It exists"
            SiteConfigProfileMapping.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(siteConfigProfileMapping)

        then:"The instance is deleted"
            SiteConfigProfileMapping.count() == 0
            response.redirectedUrl == '/siteConfigProfileMapping/index'
            flash.message != null
    }
}
