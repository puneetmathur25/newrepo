import edu.osumc.bmi.ird.ready.ConfigProfile
import edu.osumc.bmi.ird.ready.ConfigProfileInstrumentDiagnosisMapping
import edu.osumc.bmi.ird.ready.ConfigProfileMDPagesDiagnosisMapping
import edu.osumc.bmi.ird.ready.Diagnosis
import edu.osumc.bmi.ird.ready.Institution
import edu.osumc.bmi.ird.ready.Instrument
import edu.osumc.bmi.ird.ready.LikertScale
import edu.osumc.bmi.ird.ready.MDPage
import edu.osumc.bmi.ird.ready.NumericRatingScale
import edu.osumc.bmi.ird.ready.Question
import edu.osumc.bmi.ird.ready.ResponseOption

class BootStrap {

    def init = { servletContext ->
        def adminRole = edu.osumc.bmi.ird.ready.SecRole.findByAuthority('ROLE_ADMIN') ?:
            new edu.osumc.bmi.ird.ready.SecRole(authority: 'ROLE_ADMIN').save(flush: true, failOnError: true)
        def userRole = edu.osumc.bmi.ird.ready.SecRole.findByAuthority('ROLE_USER') ?:
            new edu.osumc.bmi.ird.ready.SecRole(authority: 'ROLE_USER').save(flush: true, failOnError: true)

        def adminUser = edu.osumc.bmi.ird.ready.User.findByUsername('admin') ?: 
            new edu.osumc.bmi.ird.ready.User(username: 'admin', password: 'admin', firstName: 'Admin', 
            lastName: 'Admin', email: 'wang.2799@osu.edu').save(flush: true, failOnError: true)

        if (edu.osumc.bmi.ird.ready.SecUserSecRole.get(adminUser.id, adminRole.id) == null) {
            edu.osumc.bmi.ird.ready.SecUserSecRole.create adminUser, adminRole
        }
		
		
						
		//Bootstrap Data
		initInstitutions()
		initConfigProfiles()
		
		initLikertResponseOptions()
		initNRSResponseOptions()
		initQuestions_Instruments()
		init_MDPages()
		init_Diagnosis_Instruments()
		init_ConfigProfileInstrumentDiagnosisMapping()
		 
	}
    def destroy = {
    }
	
	def initInstitutions() {
		def osu = Institution.findByName('OSU') ?:
					new Institution(name: 'OSU', streetAddress1: '650 Ackerman Road', streetAddress2: null, 
						city: 'Columbus', state: 'OH', country: 'USA', zipcode: '43210', phoneNumber: '6143665962').save(flush: true, failOnError: true)
		
		def uab = Institution.findByName('UAB') ?:
					new Institution(name: 'UAB', streetAddress1: '510 20th Street South', streetAddress2: null, 
						city: 'Birmingham', state: 'AL', country: 'USA', zipcode: '35294', phoneNumber: '2059752176').save(flush: true, failOnError: true)
	}
	
	def initConfigProfiles() {
		//Bootstrap Config Profiles for Site Management ui screens
		def cp1 = ConfigProfile.findByName('CP1') ?:
					new ConfigProfile(name: 'CP1', saveResults: true, greeting: 'CP1 greeting text', showScores:false, showRxPage: false,
						lastPageText:false, gettingBetterPictographEnabled:false, gettingBetterPictograph: null, sideEffectPictographEnabled:false, sideEffectPictograph: null,
						seriousSideEffectPictographEnabled:false, seriousSideEffectPictograph: null).save(flush: true, failOnError: true)
						
		def CP2 = ConfigProfile.findByName('CP2') ?:
					new ConfigProfile(name: 'CP2', saveResults: true, greeting: 'CP2 greeting text', showScores:false, showRxPage: false,
						lastPageText:false, gettingBetterPictographEnabled:false, gettingBetterPictograph: null, sideEffectPictographEnabled:false, sideEffectPictograph: null,
						seriousSideEffectPictographEnabled:false, seriousSideEffectPictograph: null).save(flush: true, failOnError: true)
							
		def CP3 = ConfigProfile.findByName('CP3') ?:
					new ConfigProfile(name: 'CP3', saveResults: true, greeting: 'CP3 greeting text', showScores:false, showRxPage: false,
					lastPageText:false, gettingBetterPictographEnabled:false, gettingBetterPictograph: null, sideEffectPictographEnabled:false, sideEffectPictograph: null,
					seriousSideEffectPictographEnabled:false, seriousSideEffectPictograph: null).save(flush: true, failOnError: true)
			
		def CP4 = ConfigProfile.findByName('CP4') ?:
					new ConfigProfile(name: 'CP4', saveResults: true, greeting: 'CP4 greeting text', showScores:false, showRxPage: false,
						lastPageText:false, gettingBetterPictographEnabled:false, gettingBetterPictograph: null, sideEffectPictographEnabled:false, sideEffectPictograph: null,
						seriousSideEffectPictographEnabled:false, seriousSideEffectPictograph: null).save(flush: true, failOnError: true)
			
		def CP5 = ConfigProfile.findByName('CP5') ?:
					new ConfigProfile(name: 'CP5', saveResults: true, greeting: 'CP5 greeting text', showScores:false, showRxPage: false,
						lastPageText:false, gettingBetterPictographEnabled:false, gettingBetterPictograph: null, sideEffectPictographEnabled:false, sideEffectPictograph: null,
						seriousSideEffectPictographEnabled:false, seriousSideEffectPictograph: null).save(flush: true, failOnError: true)
			
		def CP6 = ConfigProfile.findByName('CP6') ?:
					new ConfigProfile(name: 'CP6', saveResults: true, greeting: 'CP6 greeting text', showScores:false, showRxPage: false,
						lastPageText:false, gettingBetterPictographEnabled:false, gettingBetterPictograph: null, sideEffectPictographEnabled:false, sideEffectPictograph: null,
						seriousSideEffectPictographEnabled:false, seriousSideEffectPictograph: null).save(flush: true, failOnError: true)
			
		def CP7 = ConfigProfile.findByName('CP7') ?:
					new ConfigProfile(name: 'CP7', saveResults: true, greeting: 'CP7 greeting text', showScores:false, showRxPage: false,
						lastPageText:false, gettingBetterPictographEnabled:false, gettingBetterPictograph: null, sideEffectPictographEnabled:false, sideEffectPictograph: null,
						seriousSideEffectPictographEnabled:false, seriousSideEffectPictograph: null).save(flush: true, failOnError: true)
	}
	
	def initLikertResponseOptions() {
		//Quality
		def qualityRO1 = new ResponseOption(name: 'Poor', value: 1).save(flush: true, failOnError: true)
		def qualityRO2 = new ResponseOption(name: 'Fair', value: 2).save(flush: true, failOnError: true)
		def qualityRO3 = new ResponseOption(name: 'Good', value: 3).save(flush: true, failOnError: true)
		def qualityRO4 = new ResponseOption(name: 'Very Good', value: 4).save(flush: true, failOnError: true)
		def qualityRO5 = new ResponseOption(name: 'Excellent', value: 5).save(flush: true, failOnError: true)
		
		def quality = new LikertScale(name:'Quality')
						.addToResponseOptions(qualityRO1)
						.addToResponseOptions(qualityRO2)
						.addToResponseOptions(qualityRO3)
						.addToResponseOptions(qualityRO4)
						.addToResponseOptions(qualityRO5).save(flush: true, failOnError: true)

		//Comparative
		def comparativeRO1 = new ResponseOption(name: 'Much ', value: 1).save(flush: true, failOnError: true)
		def comparativeRO2 = new ResponseOption(name: 'Worse', value: 2).save(flush: true, failOnError: true)
		def comparativeRO3 = new ResponseOption(name: 'Somewhat Worse', value: 3).save(flush: true, failOnError: true)
		def comparativeRO4 = new ResponseOption(name: 'The Same', value: 4).save(flush: true, failOnError: true)
		def comparativeRO5 = new ResponseOption(name: 'Somewhat Better', value: 5).save(flush: true, failOnError: true)
		def comparativeRO6 = new ResponseOption(name: 'Better', value: 6).save(flush: true, failOnError: true)
		def comparativeRO7 = new ResponseOption(name: 'Much Better', value: 7).save(flush: true, failOnError: true)
		
		def comparative = new LikertScale(name:'Comparative')
							.addToResponseOptions(comparativeRO1)
							.addToResponseOptions(comparativeRO2)
							.addToResponseOptions(comparativeRO3)
							.addToResponseOptions(comparativeRO4)
							.addToResponseOptions(comparativeRO5)
							.addToResponseOptions(comparativeRO6)
							.addToResponseOptions(comparativeRO7).save(flush: true, failOnError: true)
		
		//Frequency
		def frequencyRO1 = new ResponseOption(name: 'None of the Time ', value: 1).save(flush: true, failOnError: true)
		def frequencyRO2 = new ResponseOption(name: 'A little of the time', value: 2).save(flush: true, failOnError: true)
		def frequencyRO3 = new ResponseOption(name: 'Some of the time', value: 3).save(flush: true, failOnError: true)
		def frequencyRO4 = new ResponseOption(name: 'Most of the time', value: 4).save(flush: true, failOnError: true)
		def frequencyRO5 = new ResponseOption(name: 'All the time', value: 5).save(flush: true, failOnError: true)
		
		def frequency = new LikertScale(name:'Frequency')
						.addToResponseOptions(frequencyRO1)
						.addToResponseOptions(frequencyRO2)
						.addToResponseOptions(frequencyRO3)
						.addToResponseOptions(frequencyRO4)
						.addToResponseOptions(frequencyRO5).save(flush: true, failOnError: true)
		
		//Importance
		def importanceRO1 = new ResponseOption(name: 'Not at all', value: 1).save(flush: true, failOnError: true)
		def importanceRO2 = new ResponseOption(name: 'A little bit', value: 2).save(flush: true, failOnError: true)
		def importanceRO3 = new ResponseOption(name: 'Moderately', value: 3).save(flush: true, failOnError: true)
		def importanceRO4 = new ResponseOption(name: 'Quite a bit', value: 4).save(flush: true, failOnError: true)
		def importanceRO5 = new ResponseOption(name: 'Extremely', value: 5).save(flush: true, failOnError: true)
		
		def importance = new LikertScale(name:'Importance')
						.addToResponseOptions(importanceRO1)
						.addToResponseOptions(importanceRO2)
						.addToResponseOptions(importanceRO3)
						.addToResponseOptions(importanceRO4)
						.addToResponseOptions(importanceRO5).save(flush: true, failOnError: true)
		
		//Agreement
		def agreementRO1 = new ResponseOption(name: 'Strongly disagree', value: 1).save(flush: true, failOnError: true)
		def agreementRO2 = new ResponseOption(name: 'Somewhat disagree', value: 2).save(flush: true, failOnError: true)
		def agreementRO3 = new ResponseOption(name: 'Not Sure', value: 3).save(flush: true, failOnError: true)
		def agreementRO4 = new ResponseOption(name: 'Somewhat Agree', value: 4).save(flush: true, failOnError: true)
		def agreementRO5 = new ResponseOption(name: 'Strongly Agree', value: 5).save(flush: true, failOnError: true)
		
		def agreement = new LikertScale(name:'Agreement')
						.addToResponseOptions(agreementRO1)
						.addToResponseOptions(agreementRO2)
						.addToResponseOptions(agreementRO3)
						.addToResponseOptions(agreementRO4)
						.addToResponseOptions(agreementRO5).save(flush: true, failOnError: true)
		
		//Satisfaction
		def satisfactionRO1 = new ResponseOption(name: 'Very dissatisfied', value: 1).save(flush: true, failOnError: true)
		def satisfactionRO2 = new ResponseOption(name: 'Somewhat disatisfied', value: 2).save(flush: true, failOnError: true)
		def satisfactionRO3 = new ResponseOption(name: 'Neither satisfied or dissatisfied', value: 3).save(flush: true, failOnError: true)
		def satisfactionRO4 = new ResponseOption(name: 'Somewhat Satisfied', value: 4).save(flush: true, failOnError: true)
		def satisfactionRO5 = new ResponseOption(name: 'Very Satisfied', value: 5).save(flush: true, failOnError: true)
		
		def satisfaction = new LikertScale(name:'Satisfaction')
							.addToResponseOptions(satisfactionRO1)
							.addToResponseOptions(satisfactionRO2)
							.addToResponseOptions(satisfactionRO3)
							.addToResponseOptions(satisfactionRO4)
							.addToResponseOptions(satisfactionRO5).save(flush: true, failOnError: true)
		
		//Duration
		def durationRO1 = new ResponseOption(name: '1-3 Days', value: 1).save(flush: true, failOnError: true)
		def durationRO2 = new ResponseOption(name: '4-7 Days', value: 2).save(flush: true, failOnError: true)
		def durationRO3 = new ResponseOption(name: '8-14 Days', value: 3).save(flush: true, failOnError: true)
		def durationRO4 = new ResponseOption(name: 'More than 14 Days', value: 4).save(flush: true, failOnError: true)
		
		def duration = new LikertScale(name:'Duration')
						.addToResponseOptions(durationRO1)
						.addToResponseOptions(durationRO2)
						.addToResponseOptions(durationRO3)
						.addToResponseOptions(durationRO4).save(flush: true, failOnError: true)
		
		//Difficulty
		def difficultyRO1 = new ResponseOption(name: 'Unable to Do', value: 1).save(flush: true, failOnError: true)
		def difficultyRO2 = new ResponseOption(name: 'With Much Difficulty', value: 2).save(flush: true, failOnError: true)
		def difficultyRO3 = new ResponseOption(name: 'With Some Difficulty', value: 3).save(flush: true, failOnError: true)
		def difficultyRO4 = new ResponseOption(name: 'Without Any Difficulty', value: 4).save(flush: true, failOnError: true)
		
		def difficulty = new LikertScale(name:'Difficulty')
						.addToResponseOptions(difficultyRO1)
						.addToResponseOptions(difficultyRO2)
						.addToResponseOptions(difficultyRO3)
						.addToResponseOptions(difficultyRO4).save(flush: true, failOnError: true)
		
		//problem
		def problemRO1 = new ResponseOption(name: 'Not Able', value: 1).save(flush: true, failOnError: true)
		def problemRO2 = new ResponseOption(name: 'Some Problems', value: 2).save(flush: true, failOnError: true)
		def problemRO3 = new ResponseOption(name: 'No Problems', value: 3).save(flush: true, failOnError: true)
		
		def problem = new LikertScale(name:'Problem')
						.addToResponseOptions(problemRO1)
						.addToResponseOptions(problemRO2)
						.addToResponseOptions(problemRO3).save(flush: true, failOnError: true)
		
		//intensity
		def intensityRO1 = new ResponseOption(name: 'None', value: 1).save(flush: true, failOnError: true)
		def intensityRO2 = new ResponseOption(name: 'Moderate', value: 2).save(flush: true, failOnError: true)
		def intensityRO3 = new ResponseOption(name: 'Extreme', value: 3).save(flush: true, failOnError: true)
		
		def intensity = new LikertScale(name:'Intensity')
							.addToResponseOptions(intensityRO1)
							.addToResponseOptions(intensityRO2)
							.addToResponseOptions(intensityRO3).save(flush: true, failOnError: true)
							
		//Boolean Agreement
		def booleanAgreementRO1 = new ResponseOption(name: 'Yes', value: 1).save(flush: true, failOnError: true)
		def booleanAgreementRO2 = new ResponseOption(name: 'No', value: 0).save(flush: true, failOnError: true)
		
		def booleanAgreement = new LikertScale(name:'Boolean Agreement')
							.addToResponseOptions(booleanAgreementRO1)
							.addToResponseOptions(booleanAgreementRO2).save(flush: true, failOnError: true)
							
							 
	}
	
	def initNRSResponseOptions() {
		def pain = new NumericRatingScale(name: 'Pain', minLevelLabel: 'No Pain', minLevelValue: 0, maxLevelLabel: 'Pain as bad as could be',
						maxLevelValue: 10, increment: 0.5).save(flush: true, failOnError: true)
	
		def flare = new NumericRatingScale(name: 'Flare', minLevelLabel: 'No Flare', minLevelValue: 0, maxLevelLabel: 'Extremely Bad',
						maxLevelValue: 10, increment: 1).save(flush: true, failOnError: true)
		
		def wellness = new NumericRatingScale(name: 'Wellness', minLevelLabel: 'Very Well ', minLevelValue: 0, maxLevelLabel: 'Very Poorly',
						maxLevelValue: 10, increment: 0.5).save(flush: true, failOnError: true)
	}
	
	def initQuestions_Instruments() {
		init_MDHAQ()
		init_MDHAQ_Other()
		init_Pain()
		init_Fatigue()
		init_Flare()
		init_PtGlobal()
		init_Pass()
		init_Improve()
		init_EQ5D()
		init_RADAI()
		init_SF12()
		init_Pt_Attitudes()
		
	}
	
	def init_MDHAQ() {
		def mdhaq_ques_starter = 'Over the past week, were you able to '
		def qualityScale = LikertScale.findByName('Quality')
		if(qualityScale){
			def mdhaq_Q1 = new Question(question: mdhaq_ques_starter + 'dress yourself, including tying shoelaces and doing buttons',
				responseType: qualityScale).save(flush: true, failOnError: true)
			
			def mdhaq_Q2 = new Question(question: mdhaq_ques_starter + 'get in and out of bed',
				responseType: qualityScale).save(flush: true, failOnError: true)
			
			def mdhaq_Q3 = new Question(question: mdhaq_ques_starter + 'lift a full cup or glass to your mouth',
				responseType: qualityScale).save(flush: true, failOnError: true)
			
			def mdhaq_Q4 = new Question(question: mdhaq_ques_starter + 'walk outdoors on flat ground',
				responseType: qualityScale).save(flush: true, failOnError: true)
			
			def mdhaq_Q5 = new Question(question: mdhaq_ques_starter + 'get in and out of a car, bus, train, or airplane',
				responseType: qualityScale).save(flush: true, failOnError: true)
			
			def mdhaq_Q6 = new Question(question: mdhaq_ques_starter + 'walk two miles or three kilometers, if you wish',
				responseType: qualityScale).save(flush: true, failOnError: true)
			
			def mdhaq_Q7 = new Question(question: mdhaq_ques_starter + 'participate in recreational activities and sports as you would like, if you wish',
				responseType: qualityScale).save(flush: true, failOnError: true)
			
			def mdhaq_Q8 = new Question(question: mdhaq_ques_starter + 'get a good night\'s sleep',
				responseType: qualityScale).save(flush: true, failOnError: true)
				
				 
			//Instrument : MDHAQ
			def mdhaq = new Instrument(name: 'MDHAQ', defaultQuestionText: null)
							.addToQuestions(mdhaq_Q1)
							.addToQuestions(mdhaq_Q2)
							.addToQuestions(mdhaq_Q3)
							.addToQuestions(mdhaq_Q4)
							.addToQuestions(mdhaq_Q5)
							.addToQuestions(mdhaq_Q6)
							.addToQuestions(mdhaq_Q7)
							.addToQuestions(mdhaq_Q8).save(flush: true, failOnError: true)
		}
	}
	
	def init_MDHAQ_Other() {
		def mdhaq_ques_starter = 'Over the past week, were you able to '
		def qualityScale = LikertScale.findByName('Quality')
		if(qualityScale){
			def mdhaq_other_Q1 = new Question(question: mdhaq_ques_starter + 'deal with feelings of anxiety or being nervous',
				responseType: qualityScale).save(flush: true, failOnError: true)
			
			def mdhaq_other_Q2 = new Question(question: mdhaq_ques_starter + 'deal with feelings of depression or feeling blue',
				responseType: qualityScale).save(flush: true, failOnError: true)
			
			 
			//Instrument : MDHAQ-Other
			def mdhaq_other = new Instrument(name: 'MDHAQ-Other', defaultQuestionText: null)
							.addToQuestions(mdhaq_other_Q1)
							.addToQuestions(mdhaq_other_Q2).save(flush: true, failOnError: true)
		}
	}
	
	def init_Pain() {
		def pain_ques_starter = 'How much pain have you had because of your '
		def painScale = NumericRatingScale.findByName('Pain')
		if(painScale){
			def pain_ra_question = new Question(question: pain_ques_starter + 'Rheumatoid arthritis over the past week',
				responseType: painScale).save(flush: true, failOnError: true)
			
			//Instrument : Pain-RA
			def pain_ra = new Instrument(name: 'Pain-RA', defaultQuestionText: null)
							.addToQuestions(pain_ra_question).save(flush: true, failOnError: true)
			
			def pain_arthritis_question = new Question(question: pain_ques_starter + 'arthritis over the past week',
				responseType: painScale).save(flush: true, failOnError: true)
				
			//Instrument : Pain-Arthritis
			def pain_arthritis = new Instrument(name: 'Pain-Arthritis', defaultQuestionText: null)
							.addToQuestions(pain_arthritis_question).save(flush: true, failOnError: true)
							
			def pain_other_question = new Question(question: pain_ques_starter + 'condition over the past week',
				responseType: painScale).save(flush: true, failOnError: true)
				
			//Instrument : Pain-Other
			def pain_other = new Instrument(name: 'Pain-Other', defaultQuestionText: null)
							.addToQuestions(pain_other_question).save(flush: true, failOnError: true)
							
		}
	}
	
	def init_Fatigue() {
		def problemScale = LikertScale.findByName('Problem')
		if(problemScale){
			def fatigue_question = new Question(question: 'How much of a problem has unusual fatigue or tiredness been for you over the past week',
				responseType: problemScale).save(flush: true, failOnError: true)
			
			//Instrument : Fatigue
			def fatigue = new Instrument(name: 'Fatigue', defaultQuestionText: null)
							.addToQuestions(fatigue_question).save(flush: true, failOnError: true)
			
		}
	}
	
	def init_Flare() {
		
		def flare_Q1
		def flare_Q2
		def flare_Q3
		def flare_Q4
		
		def booleanAgreementScale = LikertScale.findByName('Boolean Agreement')
		if(booleanAgreementScale){
			
			flare_Q1 = new Question(question: 'Are you having a flare (flare-up) of rheumatoid arthritis at this time',
				responseType: booleanAgreementScale).save(flush: true, failOnError: true)
		}
		
		def flareNRScale = NumericRatingScale.findByName('Flare')
		if(flareNRScale){
			flare_Q2 = new Question(question: 'Please pick a number to indicate the severity of your flare during the last week',
				responseType: flareNRScale).save(flush: true, failOnError: true)
		}
		
		def durationScale = LikertScale.findByName('Duration')
		if(durationScale){
			flare_Q3 = new Question(question: 'How long has this flare of your RA been going on',
				responseType: durationScale).save(flush: true, failOnError: true)
		}
		
		//Instrument : Flare
		def flare = new Instrument(name: 'Flare', defaultQuestionText: null)
						.addToQuestions(flare_Q1)
						.addToQuestions(flare_Q2)
						.addToQuestions(flare_Q3).save(flush: true, failOnError: true)
	}
	
	def init_PtGlobal() {
		
		def ptGlobalScale = NumericRatingScale.findByName('Wellness')
		if(ptGlobalScale){
			def ptGlobal_ra_question = new Question(question: 'Considering all the ways Rheumatoid arthritis affects you, indicate on the scale how well you are doing',
				responseType: ptGlobalScale).save(flush: true, failOnError: true)
				
			//Instrument : PtGlobal-RA
			def ptGlobal_ra = new Instrument(name: 'PtGlobal-RA', defaultQuestionText: null)
							.addToQuestions(ptGlobal_ra_question).save(flush: true, failOnError: true)
				
			def ptGlobal_arthritis_question = new Question(question: 'Considering all the ways arthritis affects you, indicate on the scale how well you are doing',
				responseType: ptGlobalScale).save(flush: true, failOnError: true)
				
			//Instrument : PtGlobal-Arthritis
			def ptGlobal_arthritis = new Instrument(name: 'PtGlobal-Arthritis', defaultQuestionText: null)
							.addToQuestions(ptGlobal_arthritis_question).save(flush: true, failOnError: true)
							
			def ptGlobal_other_question = new Question(question: 'Considering all the ways your condition affects you, indicate on the scale how well you are doing',
				responseType: ptGlobalScale).save(flush: true, failOnError: true)
				
			//Instrument : PtGlobal-Other
			def ptGlobal_other = new Instrument(name: 'PtGlobal-Other', defaultQuestionText: null)
							.addToQuestions(ptGlobal_other_question).save(flush: true, failOnError: true)
		}
		
	}
	
	def init_Pass() {
		
		def booleanAgreementScale = LikertScale.findByName('Boolean Agreement')
		if(booleanAgreementScale){
			
			def pass_ra_question = new Question(question: 'Considering all the different ways Rheumatoid arthritis is affecting you, if you would stay in this state for the next months, do you consider that your current state is satisfactory',
				responseType: booleanAgreementScale).save(flush: true, failOnError: true)
				
			//Instrument : Pass-RA
			def pass_ra = new Instrument(name: 'Pass-RA', defaultQuestionText: null)
							.addToQuestions(pass_ra_question).save(flush: true, failOnError: true)
				
			def pass_arthritis_question = new Question(question: 'Considering all the different ways arthritis is affecting you, if you would stay in this state for the next months, do you consider that your current state is satisfactory',
				responseType: booleanAgreementScale).save(flush: true, failOnError: true)
				
			//Instrument : Pass-Arthritis
			def pass_arthritis = new Instrument(name: 'Pass-Arthritis', defaultQuestionText: null)
							.addToQuestions(pass_arthritis_question).save(flush: true, failOnError: true)
							
			def pass_other_question = new Question(question: 'Considering all the different ways your health condition is affecting you, if you would stay in this state for the next months, do you consider that your current state is satisfactory',
				responseType: booleanAgreementScale).save(flush: true, failOnError: true)
				
			//Instrument : Pass-Other
			def pass_other = new Instrument(name: 'Pass-Other', defaultQuestionText: null)
							.addToQuestions(pass_other_question).save(flush: true, failOnError: true)
		}
		
	}
	
	
	def init_Improve() {
		
		def improveScale = LikertScale.findByName('Comparative')
		if(improveScale){
			
			def improve_ra_question = new Question(question: 'Since your last visit, is your rheumatoid arthritis (RA)',
				responseType: improveScale).save(flush: true, failOnError: true)
				
			//Instrument : Improve-RA
			def improve_ra = new Instrument(name: 'Improve-RA', defaultQuestionText: null)
							.addToQuestions(improve_ra_question).save(flush: true, failOnError: true)
				
			def improve_arthritis_question = new Question(question: 'Since your last visit, is your arthritis',
				responseType: improveScale).save(flush: true, failOnError: true)
				
			//Instrument : Improve-Arthritis
			def improve_arthritis = new Instrument(name: 'Improve-Arthritis', defaultQuestionText: null)
							.addToQuestions(improve_arthritis_question).save(flush: true, failOnError: true)
							
			def improve_other_question = new Question(question: 'Since your last visit, is your health condition',
				responseType: improveScale).save(flush: true, failOnError: true)
				
			//Instrument : Improve-Other
			def improve_other = new Instrument(name: 'Improve-Other', defaultQuestionText: null)
							.addToQuestions(improve_other_question).save(flush: true, failOnError: true)
		}
		
	}
	
	def init_EQ5D() {
		def problemScale = LikertScale.findByName('Problem')
		if(problemScale){
			def eq5d_Q1 = new Question(question: 'Mobility - walking about',
				responseType: problemScale).save(flush: true, failOnError: true)
			
			def eq5d_Q2 = new Question(question: 'Selfcare - washing or dressing myself',
				responseType: problemScale).save(flush: true, failOnError: true)
			
			def eq5d_Q3 = new Question(question: 'Usual activities - work, study, housework, family or leisure activities',
				responseType: problemScale).save(flush: true, failOnError: true)
			
			def eq5d_Q4 = new Question(question: 'Pain/discomfort',
				responseType: problemScale).save(flush: true, failOnError: true)
			
			def eq5d_Q5 = new Question(question: 'Anxiety/Depression',
				responseType: problemScale).save(flush: true, failOnError: true)
			
				 
			//Instrument : EQ5D
			def eq5d = new Instrument(name: 'EQ5D', defaultQuestionText: 'Please indicate which statements best describe your own health status today')
							.addToQuestions(eq5d_Q1)
							.addToQuestions(eq5d_Q2)
							.addToQuestions(eq5d_Q3)
							.addToQuestions(eq5d_Q4)
							.addToQuestions(eq5d_Q5).save(flush: true, failOnError: true)
		}
	}
	
	
	def init_RADAI() {
		//Instrument : SF12
		def radai = new Instrument(name: 'RADAI', defaultQuestionText: null)
						.save(flush: true, failOnError: true)
	}
	
	def init_SF12() {
			//Instrument : SF12
			def sf12 = new Instrument(name: 'SF12', defaultQuestionText: 'How does your health now limit you in perfroming the following activities')
							.save(flush: true, failOnError: true)
	}
		
//		def init_SF12() {
//			def qualityScale = LikertScale.findByName('Quality')
//			def problemScale = LikertScale.findByName('Problem')
//
//			def sf12_Q1
//			if(qualityScale){
//				sf12_Q1 = new Question(question: 'In general, would you say your health is',
//					responseType: problemScale).save(flush: true, failOnError: true)
//			}
//
//			if(problemScale){
//				def sf12_Q1 = new Question(question: 'In general, would you say your health is',
//					responseType: problemScale).save(flush: true, failOnError: true)
//
//				def sf12_Q2 = new Question(question: 'Selfcare - washing or dressing myself',
//					responseType: problemScale).save(flush: true, failOnError: true)
//
//				def sf12_Q3 = new Question(question: 'Usual activities - work, study, housework, family or leisure activities',
//					responseType: problemScale).save(flush: true, failOnError: true)
//
//				def sf12_Q4 = new Question(question: 'Pain/discomfort',
//					responseType: problemScale).save(flush: true, failOnError: true)
//
//				def sf12_Q5 = new Question(question: 'Anxiety/Depression',
//					responseType: problemScale).save(flush: true, failOnError: true)
//
//
//				//Instrument : SF12
//				def sf12 = new Instrument(name: 'SF12', defaultQuestionText: 'How does your health now limit you in perfroming the following activities')
//								.addToQuestions(sf12_Q1)
//								.addToQuestions(sf12_Q2)
//								.addToQuestions(sf12_Q3)
//								.addToQuestions(sf12_Q4)
//								.addToQuestions(sf12_Q5).save(flush: true, failOnError: true)
//			}
//	}
		
	def init_Pt_Attitudes() {
		def satisfactionScale = LikertScale.findByName('Satisfaction')
		if(satisfactionScale){
			def ptAttitudes_Q1 = new Question(question: 'As long as I don’t get worse I wouldn’t want to change my Rheumatoid arthritis medications',
				responseType: satisfactionScale).save(flush: true, failOnError: true)
			
			def ptAttitudes_Q2 = new Question(question: 'I don’t need new medications because I am satisfied with the control over my Rheumatoid arthritis',
				responseType: satisfactionScale).save(flush: true, failOnError: true)
			
			def ptAttitudes_Q3 = new Question(question: 'I don’t want the risk of side effects that might come from taking new medications',
				responseType: satisfactionScale).save(flush: true, failOnError: true)
			
			def ptAttitudes_Q4 = new Question(question: 'I am concerned that new treatments might not work as well and that I might lose control of my Rheuamtoid arthritis',
				responseType: satisfactionScale).save(flush: true, failOnError: true)
			
			def ptAttitudes_Q5 = new Question(question: 'Rate your satisfaction with your current treatment according to the following categories.',
				responseType: satisfactionScale).save(flush: true, failOnError: true)
			
			//Instrument : Pt Attitudes
			def ptAttitudes = new Instrument(name: 'Pt Attitudes', defaultQuestionText: null)
							.addToQuestions(ptAttitudes_Q1)
							.addToQuestions(ptAttitudes_Q2)
							.addToQuestions(ptAttitudes_Q3)
							.addToQuestions(ptAttitudes_Q4)
							.addToQuestions(ptAttitudes_Q5).save(flush: true, failOnError: true)
		}
	}
	
	def init_MDPages(){
		
		def MDHomunculus = new MDPage(name: 'MD Homunculus').save(flush: true, failOnError: true)
		def MDPROsValid = new MDPage(name: 'MD PROs Valid').save(flush: true, failOnError: true)
		def MDLabs = new MDPage(name: 'MD Labs').save(flush: true, failOnError: true)
		def MDGlobal = new MDPage(name: 'MD Global').save(flush: true, failOnError: true)
		def MDGloRxStatus = new MDPage(name: 'Rx Status').save(flush: true, failOnError: true)
	}
	
	def init_Diagnosis_Instruments() {
		def mdhaq = Instrument.findByName('MDHAQ')
		def mdhaq_other = Instrument.findByName('MDHAQ-Other')
		
		def pain_ra = Instrument.findByName('Pain-RA')
		def pain_arthritis = Instrument.findByName('Pain-Arthritis')
		def pain_other = Instrument.findByName('Pain-Other')
		
		def fatigue = Instrument.findByName('Fatigue')
		
		def ptGlobal_ra = Instrument.findByName('PtGlobal-RA')
		def ptGlobal_arthritis = Instrument.findByName('PtGlobal-Arthritis')
		def ptGlobal_other = Instrument.findByName('PtGlobal-Other')
		
		def pass_ra = Instrument.findByName('Pass-RA')
		def pass_arthritis = Instrument.findByName('Pass-Arthritis')
		def pass_other = Instrument.findByName('Pass-Other')
		
		def improve_ra = Instrument.findByName('Improve-RA')
		def improve_arthritis = Instrument.findByName('Improve-Arthritis')
		def improve_other = Instrument.findByName('Improve-Other')
		
		def eq5d = Instrument.findByName('EQ5D')
		def radai = Instrument.findByName('RADAI')
		def sf12 = Instrument.findByName('SF12')
		def ptAttitudes = Instrument.findByName('Pt Attitudes')
		
		
		def MDHomunculus = MDPage.findByName('MD Homunculus')
		def MDPROsValid = MDPage.findByName('MD PROs Valid')
		def MDLabs = MDPage.findByName('MD Labs')
		def MDGlobal = MDPage.findByName('MD Global')
		
		def raDiagnosis = new Diagnosis(name: 'Rheumatoid Arthritis' )
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(pain_ra)
								.addToInstruments(fatigue)
								.addToInstruments(ptGlobal_ra)
								.addToInstruments(pass_ra)
								.addToInstruments(improve_ra)
								.addToInstruments(eq5d)
								.addToInstruments(radai)
								.addToInstruments(sf12)
								.addToInstruments(ptAttitudes)
								.addToMdPages(MDHomunculus)
								.addToMdPages(MDPROsValid)
								.addToMdPages(MDLabs)
								.addToMdPages(MDGlobal)
								.save(flush: true, failOnError: true)
								
								
		def uraDiagnosis = new Diagnosis(name: 'Undifferentiated Arthritis')
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(pain_arthritis)
								.addToInstruments(fatigue)
								.addToInstruments(ptGlobal_arthritis)
								.addToInstruments(pass_arthritis)
								.addToInstruments(improve_arthritis)
								.addToInstruments(eq5d)
								.addToInstruments(radai)
								.addToInstruments(sf12)
								.addToMdPages(MDHomunculus)
								.addToMdPages(MDPROsValid)
								.addToMdPages(MDLabs)
								.addToMdPages(MDGlobal)
								.save(flush: true, failOnError: true)
		//Psoriatic arthritis
		def psoriaticArthritisDiagnosis = new Diagnosis(name: 'Psoriatic Arthritis')
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(pain_arthritis)
								.addToInstruments(fatigue)
								.addToInstruments(ptGlobal_arthritis)
								.addToInstruments(pass_arthritis)
								.addToInstruments(improve_arthritis)
								.addToInstruments(eq5d)
								.addToInstruments(sf12).save(flush: true, failOnError: true)

		//Ankylosing spondylitis 
		def ankylosingSpondylitisDiagnosis = new Diagnosis(name: 'Ankylosing Spondylitis')
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(pain_arthritis)
								.addToInstruments(fatigue)
								.addToInstruments(ptGlobal_arthritis)
								.addToInstruments(pass_arthritis)
								.addToInstruments(improve_arthritis)
								.addToInstruments(eq5d)
								.addToInstruments(sf12).save(flush: true, failOnError: true)
								
		//IBD-associated arthritis
		def IBDAssociatedArthritisDiagnosis = new Diagnosis(name: 'IBD-associated Arthritis')
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(pain_arthritis)
								.addToInstruments(fatigue)
								.addToInstruments(ptGlobal_arthritis)
								.addToInstruments(pass_arthritis)
								.addToInstruments(improve_arthritis)
								.addToInstruments(eq5d)
								.addToInstruments(sf12).save(flush: true, failOnError: true)
								
		//Other spondyloarthropathy
		def otherSpondyloarthropathyDiagnosis = new Diagnosis(name: 'Other Spondyloarthropathy')
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(pain_arthritis)
								.addToInstruments(fatigue)
								.addToInstruments(ptGlobal_arthritis)
								.addToInstruments(pass_arthritis)
								.addToInstruments(improve_arthritis)
								.addToInstruments(eq5d)
								.addToInstruments(sf12).save(flush: true, failOnError: true)
								
		//SLE
		def sleDiagnosis = new Diagnosis(name: 'SLE')
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(pain_other)
								.addToInstruments(fatigue)
								.addToInstruments(ptGlobal_other)
								.addToInstruments(pass_other)
								.addToInstruments(improve_other)
								.addToInstruments(eq5d)
								.addToInstruments(sf12).save(flush: true, failOnError: true)
								
		//Sjogrens
		def sjogrensDiagnosis = new Diagnosis(name: 'Sjogrens')
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(fatigue)
								.addToInstruments(eq5d)
								.addToInstruments(sf12).save(flush: true, failOnError: true)
								
		//Osteoarthritis
		def osteoarthritisDiagnosis = new Diagnosis(name: 'Osteoarthritis')
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(pain_arthritis)
								.addToInstruments(fatigue)
								.addToInstruments(ptGlobal_arthritis)
								.addToInstruments(pass_arthritis)
								.addToInstruments(improve_arthritis)
								.addToInstruments(eq5d)
								.addToInstruments(sf12).save(flush: true, failOnError: true)
								
		//Fibromylagia
		def fibromylagiaDiagnosis = new Diagnosis(name: 'Fibromylagia')
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(pain_other)
								.addToInstruments(fatigue)
								.addToInstruments(ptGlobal_other)
								.addToInstruments(pass_other)
								.addToInstruments(improve_other)
								.addToInstruments(eq5d)
								.addToInstruments(sf12).save(flush: true, failOnError: true)
								
		//Myositis
		def myositisDiagnosis = new Diagnosis(name: 'Myositis')
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(pain_other)
								.addToInstruments(fatigue)
								.addToInstruments(ptGlobal_other)
								.addToInstruments(pass_other)
								.addToInstruments(improve_other)
								.addToInstruments(eq5d)
								.addToInstruments(sf12).save(flush: true, failOnError: true)
								
		//Gout
		def goutDiagnosis = new Diagnosis(name: 'Gout')
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(pain_arthritis)
								.addToInstruments(fatigue)
								.addToInstruments(ptGlobal_arthritis)
								.addToInstruments(pass_arthritis)
								.addToInstruments(improve_arthritis)
								.addToInstruments(eq5d)
								.addToInstruments(sf12).save(flush: true, failOnError: true)
								
		//Systematic Sclerosis
		def systematicSclerosisDiagnosis = new Diagnosis(name: 'Systematic Sclerosis')
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(pain_other)
								.addToInstruments(fatigue)
								.addToInstruments(ptGlobal_other)
								.addToInstruments(pass_other)
								.addToInstruments(improve_other)
								.addToInstruments(eq5d)
								.addToInstruments(sf12).save(flush: true, failOnError: true)
								
		//Other
		def otherDiagnosis = new Diagnosis(name: 'Other')
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(pain_other)
								.addToInstruments(fatigue)
								.addToInstruments(ptGlobal_other)
								.addToInstruments(pass_other)
								.addToInstruments(improve_other)
								.addToInstruments(eq5d)
								.addToInstruments(sf12)
								.addToInstruments(ptAttitudes).save(flush: true, failOnError: true)
														
		//Not Sure
		def notSureDiagnosis = new Diagnosis(name: 'Not Sure')
								.addToInstruments(mdhaq)
								.addToInstruments(mdhaq_other)
								.addToInstruments(pain_other)
								.addToInstruments(fatigue)
								.addToInstruments(ptGlobal_other)
								.addToInstruments(pass_other)
								.addToInstruments(improve_other)
								.addToInstruments(eq5d)
								.addToInstruments(sf12)
								.addToInstruments(ptAttitudes).save(flush: true, failOnError: true)
	}
	
	def init_ConfigProfileInstrumentDiagnosisMapping() {
		def mdhaq = Instrument.findByName('MDHAQ')
		def mdhaq_other = Instrument.findByName('MDHAQ-Other')
		
		def pain_ra = Instrument.findByName('Pain-RA')
		def pain_arthritis = Instrument.findByName('Pain-Arthritis')
		def pain_other = Instrument.findByName('Pain-Other')
		
		def fatigue = Instrument.findByName('Fatigue')
		
		def ptGlobal_ra = Instrument.findByName('PtGlobal-RA')
		def ptGlobal_arthritis = Instrument.findByName('PtGlobal-Arthritis')
		def ptGlobal_other = Instrument.findByName('PtGlobal-Other')
		
		def pass_ra = Instrument.findByName('Pass-RA')
		def pass_arthritis = Instrument.findByName('Pass-Arthritis')
		def pass_other = Instrument.findByName('Pass-Other')
		
		def improve_ra = Instrument.findByName('Improve-RA')
		def improve_arthritis = Instrument.findByName('Improve-Arthritis')
		def improve_other = Instrument.findByName('Improve-Other')
		
		def eq5d = Instrument.findByName('EQ5D')
		def radai = Instrument.findByName('RADAI')
		def sf12 = Instrument.findByName('SF12')
		def ptAttitudes = Instrument.findByName('Pt Attitudes')
		
		
		def MDHomunculus = MDPage.findByName('MD Homunculus')
		def MDPROsValid = MDPage.findByName('MD PROs Valid')
		def MDLabs = MDPage.findByName('MD Labs')
		def MDGlobal = MDPage.findByName('MD Global')
		def RxStatus = MDPage.findByName('Rx Status')
		
		//Diagnosis
		def raDiagnosis = Diagnosis.findByName('Rheumatoid Arthritis')
		def cp1 = ConfigProfile.findByName('CP1')
		
		def cpInstDiag_1 = new ConfigProfileInstrumentDiagnosisMapping(configProfile: cp1, instrument: mdhaq, 
							diagnosis: raDiagnosis, instrumentDiagnosisEnabled: true).save(flush: true, failOnError: true)
							
		def cpMDPageDiag_1 = new ConfigProfileMDPagesDiagnosisMapping(configProfile: cp1, mdPage: RxStatus,
			diagnosis: raDiagnosis, mdPageDiagnosisEnabled: true).save(flush: true, failOnError: true)
								
	}
	

	
}
