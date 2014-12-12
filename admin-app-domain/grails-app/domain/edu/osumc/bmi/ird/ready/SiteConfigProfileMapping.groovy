package edu.osumc.bmi.ird.ready

class SiteConfigProfileMapping {

	Site site
	ConfigProfile configProfile
	boolean defaultConfigProfile
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		site nullable : false
		configProfile nullable : false
		defaultConfigProfile nullable : false
		
		dateCreated nullable:true
		lastUpdated nullable:true
    }
 
}
