package edu.osumc.bmi.ird.ready;

enum InstrumentType {
	PATIENT("Patient"), PHYSICIAN("Physician")
	
	String value
	
	InstrumentType(String value) {
		this.value = value
	}
	
	String toString() {
		return value
	}
}


