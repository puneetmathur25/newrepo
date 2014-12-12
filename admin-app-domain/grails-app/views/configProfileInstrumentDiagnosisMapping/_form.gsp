<%@ page import="edu.osumc.bmi.ird.ready.ConfigProfileInstrumentDiagnosisMapping" %>



<div class="fieldcontain ${hasErrors(bean: configProfileInstrumentDiagnosisMappingInstance, field: 'configProfile', 'error')} required">
	<label for="configProfile">
		<g:message code="configProfileInstrumentDiagnosisMapping.configProfile.label" default="Config Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="configProfile" name="configProfile.id" from="${edu.osumc.bmi.ird.ready.ConfigProfile.list()}" optionKey="id" required="" value="${configProfileInstrumentDiagnosisMappingInstance?.configProfile?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstrumentDiagnosisMappingInstance, field: 'diagnosis', 'error')} required">
	<label for="diagnosis">
		<g:message code="configProfileInstrumentDiagnosisMapping.diagnosis.label" default="Diagnosis" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="diagnosis" name="diagnosis.id" from="${edu.osumc.bmi.ird.ready.Diagnosis.list()}" optionKey="id" required="" value="${configProfileInstrumentDiagnosisMappingInstance?.diagnosis?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstrumentDiagnosisMappingInstance, field: 'instrument', 'error')} required">
	<label for="instrument">
		<g:message code="configProfileInstrumentDiagnosisMapping.instrument.label" default="Instrument" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="instrument" name="instrument.id" from="${edu.osumc.bmi.ird.ready.Instrument.list()}" optionKey="id" required="" value="${configProfileInstrumentDiagnosisMappingInstance?.instrument?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstrumentDiagnosisMappingInstance, field: 'instrumentDiagnosisEnabled', 'error')} ">
	<label for="instrumentDiagnosisEnabled">
		<g:message code="configProfileInstrumentDiagnosisMapping.instrumentDiagnosisEnabled.label" default="Instrument Diagnosis Enabled" />
		
	</label>
	<g:checkBox name="instrumentDiagnosisEnabled" value="${configProfileInstrumentDiagnosisMappingInstance?.instrumentDiagnosisEnabled}" />

</div>

