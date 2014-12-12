package edu.osumc.bmi.ird.ready

import java.util.Date;

class ConfigProfileMDPagesDiagnosisMapping {
	
	ConfigProfile configProfile
	MDPage mdPage
	Diagnosis diagnosis
	Boolean mdPageDiagnosisEnabled
	
	Date dateCreated
	Date lastUpdated

    static constraints = {
		
		dateCreated nullable:true
		lastUpdated nullable:true
    }
	
	String toString() {
		return mdPage.name + " : " + diagnosis.name + " : " + mdPageDiagnosisEnabled
	}
}
