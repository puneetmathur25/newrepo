package edu.osumc.bmi.ird.ready


class ConfigProfileInstrumentDiagnosisMapping {

	ConfigProfile configProfile
	Instrument instrument
	Diagnosis diagnosis
	Boolean instrumentDiagnosisEnabled
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		
		dateCreated nullable:true
		lastUpdated nullable:true
    }
	
//	String toString() {
//		return instrument.name + " : " + diagnosis.name + " : " + instrumentDiagnosisEnabled
//	}
	
	
}
