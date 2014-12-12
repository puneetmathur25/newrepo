package edu.osumc.bmi.ird.ready

class LikertScale extends ResponseType{
	
	static hasMany = [responseOptions : ResponseOption]
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		responseOptions nullable:false
		dateCreated nullable:true
		lastUpdated nullable:true
	}
	
}
