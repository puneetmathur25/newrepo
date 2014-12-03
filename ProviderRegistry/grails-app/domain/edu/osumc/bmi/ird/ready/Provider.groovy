package edu.osumc.bmi.ird.ready

import java.util.Date;

class Provider {
	
	String firstName
	String middleName
	String lastName
	String streetAdress1
	String streetAdress2
	String city
	String state
	String zipcode
	String country
	String phoneNumber
	String fax
	String credential
	String npi
	String prefix
	String suffix
	
	Date dateCreated
	Date lastUpdated

    static constraints = {
		
		firstName nullable:true
		middleName nullable:true
		lastName nullable:true
		streetAdress1 nullable:true
		streetAdress2 nullable:true
		city nullable:true
		state nullable:true
		zipcode nullable:true
		country nullable:true
		phoneNumber nullable:true
		fax nullable:true
		credential nullable:true
		npi unique:true, nullable:false
		prefix nullable:true
		suffix nullable:true
		
    }
	
	String toString() {
		return firstName + " " + lastName + " ( " + npi + " )"
	}
}
