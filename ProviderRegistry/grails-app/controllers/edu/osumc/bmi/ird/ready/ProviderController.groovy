package edu.osumc.bmi.ird.ready

import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory


class ProviderController {
	
	static Log LOG = LogFactory.getLog(ProviderController.class);
	static responseFormats = ['json', 'xml']

    def index() { 
		println Provider.count()
		respond Provider.list(params), model:[providerInstanceCount: Provider.count()]
	}
	
	def searchByNPI() {
		LOG.debug("searchByNPI : npi : " + params.npi)
		def providers = Provider.findAllByNpiLike("%" + params.npi + "%")
		 respond providers
	}
	
	def searchByFirstName() {
		LOG.debug("searchByFirstName : firstName : " + params.firstName)
		def providers = Provider.findAllByFirstNameLike("%" + params.firstName + "%")
		 respond providers
	}
	
	def searchByLastName() {
		LOG.debug("searchByLastName : lastName : " + params.lastName)
		def providers = Provider.findAllByLastNameLike("%" + params.lastName + "%")
		 respond providers
	}
	
	def searchByName() {
		LOG.debug("searchByName : firstName : " + params.firstName +  " ; lastName : " + params.lastName)
		
		def providerCriteria = Provider.createCriteria()
		def providers = providerCriteria.list {
			and{
				ilike "firstName" , "%" + params.firstName + "%"
				ilike "lastName" , "%" + params.lastName + "%"
			}
		}
		respond providers
	}
	
	def searchByNameCityState() {
		LOG.debug("searchByNameCityState : firstName : " + params.firstName +  " ; lastName : " + params.lastName + 
			" ; city : " + params.city + " ; state : " + params.state)

		def providerCriteria = Provider.createCriteria()
		def providers = providerCriteria.list {
			and{
				ilike "firstName" , "%" + params.firstName + "%"
				ilike "lastName" , "%" + params.lastName + "%"
				ilike "city" , "%" + params.city + "%"
				ilike "state" , "%" + params.state + "%"
			}
		}
		respond providers
	}
}
