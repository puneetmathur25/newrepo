package edu.osumc.bmi.ird.ready

class Site {

	String username
	String password
	String greeting
	Institution institution
	
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [physicians : Physician, siteConfigProfileMappings : SiteConfigProfileMapping]
    
	static constraints = {
		//attributes
		username blank: false, unique: true, size: 3..16
		password blank: false, size: 5..16
		greeting nullable: true, size: 3..256
		
		dateCreated nullable:true
		lastUpdated nullable:true
		
		//associations
		institution nullable: false
		physicians nullable: true
		siteConfigProfileMappings nullable: true
	}
	
	String toString() {
		return username
	}
}
