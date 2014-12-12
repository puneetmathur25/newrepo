package edu.osumc.bmi.ird.ready

class NumericRatingScale extends ResponseType {
	
	String minLevelLabel
	int minLevelValue
	String maxLevelLabel
	int maxLevelValue
	float increment
	
	Date dateCreated
	Date lastUpdated

    static constraints = {
		minLevelLabel blank: false , nullable: false
		minLevelValue nullable: false
		maxLevelLabel blank: false , nullable: false
		maxLevelValue nullable: false
		increment blank: false , nullable: false
		
		dateCreated nullable:true
		lastUpdated nullable:true
    }
	
	String toString() {
		return minLevelLabel + " (" + minLevelValue + ") - " + maxLevelLabel + " (" + maxLevelValue + ")"
	}
}
