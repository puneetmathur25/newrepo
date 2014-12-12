<%@ page import="edu.osumc.bmi.ird.ready.Diagnosis" %>



<div class="fieldcontain ${hasErrors(bean: diagnosisInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="diagnosis.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="128" required="" value="${diagnosisInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diagnosisInstance, field: 'instruments', 'error')} ">
	<label for="instruments">
		<g:message code="diagnosis.instruments.label" default="Instruments" />
		
	</label>
	<g:select name="instruments" from="${edu.osumc.bmi.ird.ready.Instrument.list()}" multiple="multiple" optionKey="id" size="5" value="${diagnosisInstance?.instruments*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diagnosisInstance, field: 'mdPages', 'error')} ">
	<label for="mdPages">
		<g:message code="diagnosis.mdPages.label" default="Md Pages" />
		
	</label>
	<g:select name="mdPages" from="${edu.osumc.bmi.ird.ready.MDPage.list()}" multiple="multiple" optionKey="id" size="5" value="${diagnosisInstance?.mdPages*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diagnosisInstance, field: 'rxStatus', 'error')} ">
	<label for="rxStatus">
		<g:message code="diagnosis.rxStatus.label" default="Rx Status" />
		
	</label>
	<g:checkBox name="rxStatus" value="${diagnosisInstance?.rxStatus}" />

</div>

