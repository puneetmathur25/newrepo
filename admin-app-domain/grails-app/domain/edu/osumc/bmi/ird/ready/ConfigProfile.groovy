package edu.osumc.bmi.ird.ready

class ConfigProfile {
	
	String name
	Boolean saveResults
	String greeting
	Boolean showScores
	Boolean showRxPage
	String lastPageText
	
	Boolean gettingBetterPictographEnabled
	Pictograph gettingBetterPictograph
	
	Boolean sideEffectPictographEnabled
	Pictograph sideEffectPictograph
	
	Boolean seriousSideEffectPictographEnabled
	Pictograph seriousSideEffectPictograph
	
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [configProfileSiteMappings : SiteConfigProfileMapping, 
						cpInstDiagMapping : ConfigProfileInstrumentDiagnosisMapping]
	
    static constraints = {
		//attributes
		name blank: false , nullable: false, size: 3..16
		saveResults nullable: false
		greeting nullable: true, size: 3..256
		lastPageText nullable: true, size: 3..256
		showScores nullable: false
		showRxPage nullable: false
		
		dateCreated nullable:true
		lastUpdated nullable:true
		
		//association
		configProfileSiteMappings nullable: true
		cpInstDiagMapping nullable: true
		gettingBetterPictograph nullable: true
		sideEffectPictograph nullable: true
		seriousSideEffectPictograph nullable: true
    }
	
	String toString() {
		return name
	}
	
}
