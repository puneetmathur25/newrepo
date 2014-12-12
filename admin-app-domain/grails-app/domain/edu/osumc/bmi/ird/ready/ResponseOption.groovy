package edu.osumc.bmi.ird.ready

class ResponseOption {

	String name
	String value
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		name blank: false, nullable:false, size: 2..64
		value blank: false, nullable:false
		
		dateCreated nullable:true
		lastUpdated nullable:true
    }
	 
	String toString() {
		return name + " (" + value + ")"
	}
}
