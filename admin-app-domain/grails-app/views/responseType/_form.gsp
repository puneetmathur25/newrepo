<%@ page import="edu.osumc.bmi.ird.ready.ResponseType" %>



<div class="fieldcontain ${hasErrors(bean: responseTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="responseType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="64" required="" value="${responseTypeInstance?.name}"/>

</div>

