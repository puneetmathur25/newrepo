package edu.osumc.bmi.ird.ready


class Diagnosis {
	
	String name
	//Boolean rxStatus = false
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [instruments : Instrument, mdPages : MDPage]

    static constraints = {
		//attributes
		name blank: false , nullable: false, size: 2..128
//		rxStatus nullable:true
		dateCreated nullable:true
		lastUpdated nullable:true
		
		//associations
		instruments nullable: true
		mdPages nullable: true
    }
	
	String toString() {
		return name
	}
}
