package edu.osumc.bmi.ird.ready

import java.util.Date;

class Instrument {
	
	String name
	String defaultQuestionText
	InstrumentType instrumentType
	static belongsTo = Diagnosis
	static hasMany = [questions : Question, diagnoses : Diagnosis]
	
	Date dateCreated
	Date lastUpdated

    static constraints = {
		//attributes
		name blank: false , nullable: false, size: 2..128
		instrumentType nullable:true
		defaultQuestionText nullable: true
		
		dateCreated nullable:true
		lastUpdated nullable:true
		
		//associations
		questions nullable: true
		diagnoses nullable: true
    }
	
	String toString() {
		return name
	}
}
