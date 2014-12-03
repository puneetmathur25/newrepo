// Place your Spring DSL code here

import edu.osumc.bmi.ird.ready.Provider
import grails.rest.render.json.JsonRenderer
beans = {
	providerJSONRenderer(JsonRenderer, Provider) {
		excludes = ['class', 'dateCreated', 'lastUpdated', 'middleName', 'streetAdress1','streetAdress2','phoneNumber','fax','credential','prefix','suffix',
			'zipcode','country','id']
	}
}
