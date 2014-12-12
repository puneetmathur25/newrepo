package edu.osumc.bmi.ird.ready

class Physician {
	
	String firstName
	String middleName
	String lastName
	String streetAdress1
	String streetAdress2
	String city
	String state
	String country
	String phoneNumber
	String credential
	String npi
	String prefix
	String suffix
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = Site
	static hasMany = [sites : Site]

    static constraints = {
		//attributes
		firstName blank: false , nullable: false, size: 3..16
		middleName nullable: true
		lastName blank: false , nullable: false, size: 3..16
		streetAdress1 blank: false , nullable: false, size: 3..32
		streetAdress2 nullable: true
		city blank: false , nullable: false, size: 3..16
		state blank: false , nullable: false, size: 3..16
		country nullable: true, size: 3..16
		phoneNumber nullable: true
		credential nullable: true, size: 3..16
		npi blank: false , nullable: false, size: 3..16
		prefix nullable: true
		suffix nullable: true
		
		dateCreated nullable:true
		lastUpdated nullable:true
		
		//association
		sites nullable: false
    }
	
	String toString() {
		return firstName + " " + lastName
	}
}
