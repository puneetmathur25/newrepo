package edu.osumc.bmi.ird.ready


class Diagnosis {
	
	String name
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [instruments : Instrument]

    static constraints = {
		//attributes
		name blank: false , nullable: false, size: 2..128
		dateCreated nullable:true
		lastUpdated nullable:true
		
		//associations
		instruments nullable: true
    }
	
	String toString() {
		return name
	}
}
