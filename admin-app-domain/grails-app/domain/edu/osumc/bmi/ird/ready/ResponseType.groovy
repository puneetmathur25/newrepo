package edu.osumc.bmi.ird.ready

class ResponseType {

	String name
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		name blank: false, nullable: false, size: 2..64
		dateCreated nullable:true
		lastUpdated nullable:true
    }
	
	String toString() {
		return name
	}
}
