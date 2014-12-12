package edu.osumc.bmi.ird.ready



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NumericRatingScaleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NumericRatingScale.list(params), model:[numericRatingScaleInstanceCount: NumericRatingScale.count()]
    }

    def show(NumericRatingScale numericRatingScaleInstance) {
        respond numericRatingScaleInstance
    }

    def create() {
        respond new NumericRatingScale(params)
    }

    @Transactional
    def save(NumericRatingScale numericRatingScaleInstance) {
        if (numericRatingScaleInstance == null) {
            notFound()
            return
        }

        if (numericRatingScaleInstance.hasErrors()) {
            respond numericRatingScaleInstance.errors, view:'create'
            return
        }

        numericRatingScaleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'numericRatingScale.label', default: 'NumericRatingScale'), numericRatingScaleInstance.id])
                redirect numericRatingScaleInstance
            }
            '*' { respond numericRatingScaleInstance, [status: CREATED] }
        }
    }

    def edit(NumericRatingScale numericRatingScaleInstance) {
        respond numericRatingScaleInstance
    }

    @Transactional
    def update(NumericRatingScale numericRatingScaleInstance) {
        if (numericRatingScaleInstance == null) {
            notFound()
            return
        }

        if (numericRatingScaleInstance.hasErrors()) {
            respond numericRatingScaleInstance.errors, view:'edit'
            return
        }

        numericRatingScaleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'NumericRatingScale.label', default: 'NumericRatingScale'), numericRatingScaleInstance.id])
                redirect numericRatingScaleInstance
            }
            '*'{ respond numericRatingScaleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NumericRatingScale numericRatingScaleInstance) {

        if (numericRatingScaleInstance == null) {
            notFound()
            return
        }

        numericRatingScaleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'NumericRatingScale.label', default: 'NumericRatingScale'), numericRatingScaleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'numericRatingScale.label', default: 'NumericRatingScale'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
