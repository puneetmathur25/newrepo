package edu.osumc.bmi.ird.ready;

enum PictoTypes {

	HAPPY("Happy"), NEUTRAL("Neutral"), SAD("Sad") 

	String value

	PictoTypes(String value) { 
		this.value = value 
	}

	String toString() { 
		return value 
	} 
	
	 
}
