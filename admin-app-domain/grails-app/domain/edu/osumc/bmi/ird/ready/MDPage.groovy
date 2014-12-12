package edu.osumc.bmi.ird.ready

class MDPage {

	String name
	static belongsTo = Diagnosis
	static hasMany = [diagnoses : Diagnosis]
	
    static constraints = {
		
		//associations
		diagnoses nullable: true
    }
	
	String toString() {
		return name 
	}
}
