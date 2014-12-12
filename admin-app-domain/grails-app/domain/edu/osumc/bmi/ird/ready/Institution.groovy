package edu.osumc.bmi.ird.ready

class Institution {
	
	String name
	String streetAddress1
	String streetAddress2
	String city
	String state
	String country
	String zipcode
	String phoneNumber
	
	Date dateCreated
	Date lastUpdated

    static constraints = {
		name blank: false , nullable: false,  size: 3..16
		streetAddress1 blank: false , nullable: false,  size: 3..32
		streetAddress2 nullable: true
		city blank: false , nullable: false, size: 2..16
		state blank: false , nullable: false, size: 2..16
		country blank: false , nullable: false, size: 2..16
		zipcode blank: false , nullable: false, size: 3..16
		phoneNumber blank: false , nullable: false, size: 3..16
		
		dateCreated nullable:true
		lastUpdated nullable:true
    }
	
	String toString() {
		return name
	}
}
