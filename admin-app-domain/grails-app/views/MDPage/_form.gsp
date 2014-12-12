<%@ page import="edu.osumc.bmi.ird.ready.MDPage" %>



<div class="fieldcontain ${hasErrors(bean: MDPagesInstance, field: 'diagnoses', 'error')} ">
	<label for="diagnoses">
		<g:message code="MDPages.diagnoses.label" default="Diagnoses" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: MDPagesInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="MDPages.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${MDPagesInstance?.name}"/>

</div>

