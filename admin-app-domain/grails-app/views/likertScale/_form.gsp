<%@ page import="edu.osumc.bmi.ird.ready.LikertScale" %>



<div class="fieldcontain ${hasErrors(bean: likertScaleInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="likertScale.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="64" required="" value="${likertScaleInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: likertScaleInstance, field: 'responseOptions', 'error')} required">
	<label for="responseOptions">
		<g:message code="likertScale.responseOptions.label" default="Response Options" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="responseOptions" from="${edu.osumc.bmi.ird.ready.ResponseOption.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${likertScaleInstance?.responseOptions*.id}" class="many-to-many"/>

</div>

