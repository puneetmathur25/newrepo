<%@ page import="edu.osumc.bmi.ird.ready.ResponseOption" %>



<div class="fieldcontain ${hasErrors(bean: responseOptionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="responseOption.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="64" required="" value="${responseOptionInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: responseOptionInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="responseOption.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="value" required="" value="${responseOptionInstance?.value}"/>

</div>

