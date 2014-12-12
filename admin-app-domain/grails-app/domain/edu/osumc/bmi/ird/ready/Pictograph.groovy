package edu.osumc.bmi.ird.ready

class Pictograph {
	
	String label
	PictoTypes positivePictoType
	int positivePictoValue
	PictoTypes negativePictoType
	int negativePictoValue
	int maxPictoValue // max value for Pictograph; e.g. if maxPictoValue = 100 for label=Chance of getting better, then it might be useful 
	//in future to auto-populate 'negativePictoValue' =  maxValue - positivePictoValue
	
	Date dateCreated
	Date lastUpdated

    static constraints = {
		dateCreated nullable:true
		lastUpdated nullable:true
		maxPictoValue nullable:true
    }
	
	String toString() {
		return label
	}
}
