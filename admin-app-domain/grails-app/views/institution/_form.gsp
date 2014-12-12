<%@ page import="edu.osumc.bmi.ird.ready.Institution" %>



<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="institution.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="16" required="" value="${institutionInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'streetAddress1', 'error')} required">
	<label for="streetAddress1">
		<g:message code="institution.streetAddress1.label" default="Street Address1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="streetAddress1" maxlength="32" required="" value="${institutionInstance?.streetAddress1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'streetAddress2', 'error')} ">
	<label for="streetAddress2">
		<g:message code="institution.streetAddress2.label" default="Street Address2" />
		
	</label>
	<g:textField name="streetAddress2" value="${institutionInstance?.streetAddress2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="institution.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" maxlength="16" required="" value="${institutionInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="institution.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="state" maxlength="16" required="" value="${institutionInstance?.state}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="institution.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="country" maxlength="16" required="" value="${institutionInstance?.country}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'zipcode', 'error')} required">
	<label for="zipcode">
		<g:message code="institution.zipcode.label" default="Zipcode" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="zipcode" maxlength="16" required="" value="${institutionInstance?.zipcode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'phoneNumber', 'error')} required">
	<label for="phoneNumber">
		<g:message code="institution.phoneNumber.label" default="Phone Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phoneNumber" maxlength="16" required="" value="${institutionInstance?.phoneNumber}"/>

</div>

