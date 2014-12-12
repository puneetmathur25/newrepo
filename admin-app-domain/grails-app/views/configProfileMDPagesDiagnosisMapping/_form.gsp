<%@ page import="edu.osumc.bmi.ird.ready.ConfigProfileMDPagesDiagnosisMapping" %>



<div class="fieldcontain ${hasErrors(bean: configProfileMDPagesDiagnosisMappingInstance, field: 'configProfile', 'error')} required">
	<label for="configProfile">
		<g:message code="configProfileMDPagesDiagnosisMapping.configProfile.label" default="Config Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="configProfile" name="configProfile.id" from="${edu.osumc.bmi.ird.ready.ConfigProfile.list()}" optionKey="id" required="" value="${configProfileMDPagesDiagnosisMappingInstance?.configProfile?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileMDPagesDiagnosisMappingInstance, field: 'diagnosis', 'error')} required">
	<label for="diagnosis">
		<g:message code="configProfileMDPagesDiagnosisMapping.diagnosis.label" default="Diagnosis" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="diagnosis" name="diagnosis.id" from="${edu.osumc.bmi.ird.ready.Diagnosis.list()}" optionKey="id" required="" value="${configProfileMDPagesDiagnosisMappingInstance?.diagnosis?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileMDPagesDiagnosisMappingInstance, field: 'mdPage', 'error')} required">
	<label for="mdPage">
		<g:message code="configProfileMDPagesDiagnosisMapping.mdPage.label" default="Md Page" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="mdPage" name="mdPage.id" from="${edu.osumc.bmi.ird.ready.MDPage.list()}" optionKey="id" required="" value="${configProfileMDPagesDiagnosisMappingInstance?.mdPage?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileMDPagesDiagnosisMappingInstance, field: 'mdPageDiagnosisEnabled', 'error')} ">
	<label for="mdPageDiagnosisEnabled">
		<g:message code="configProfileMDPagesDiagnosisMapping.mdPageDiagnosisEnabled.label" default="Md Page Diagnosis Enabled" />
		
	</label>
	<g:checkBox name="mdPageDiagnosisEnabled" value="${configProfileMDPagesDiagnosisMappingInstance?.mdPageDiagnosisEnabled}" />

</div>

