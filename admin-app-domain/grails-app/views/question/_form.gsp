<%@ page import="edu.osumc.bmi.ird.ready.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="question.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="question" cols="40" rows="5" maxlength="256" required="" value="${questionInstance?.question}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'responseType', 'error')} required">
	<label for="responseType">
		<g:message code="question.responseType.label" default="Response Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="responseType" name="responseType.id" from="${edu.osumc.bmi.ird.ready.ResponseType.list()}" optionKey="id" required="" value="${questionInstance?.responseType?.id}" class="many-to-one"/>

</div>

