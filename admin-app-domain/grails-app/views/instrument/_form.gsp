<%@ page import="edu.osumc.bmi.ird.ready.Instrument" %>



<div class="fieldcontain ${hasErrors(bean: instrumentInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="instrument.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="128" required="" value="${instrumentInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: instrumentInstance, field: 'defaultQuestionText', 'error')} ">
	<label for="defaultQuestionText">
		<g:message code="instrument.defaultQuestionText.label" default="Default Question Text" />
		
	</label>
	<g:textField name="defaultQuestionText" value="${instrumentInstance?.defaultQuestionText}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: instrumentInstance, field: 'questions', 'error')} ">
	<label for="questions">
		<g:message code="instrument.questions.label" default="Questions" />
		
	</label>
	<g:select name="questions" from="${edu.osumc.bmi.ird.ready.Question.list()}" multiple="multiple" optionKey="id" size="5" value="${instrumentInstance?.questions*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: instrumentInstance, field: 'diagnoses', 'error')} ">
	<label for="diagnoses">
		<g:message code="instrument.diagnoses.label" default="Diagnoses" />
		
	</label>
	

</div>

