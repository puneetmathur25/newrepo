package edu.osumc.bmi.ird.ready

class Question {

	String question
	ResponseType responseType
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		question blank: false, nullable : false, size: 3..256
		responseType nullable : false
		
		dateCreated nullable:true
		lastUpdated nullable:true
    }
	
	String toString() {
		return question
	}
}
