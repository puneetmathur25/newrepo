<%@ page import="edu.osumc.bmi.ird.ready.Physician" %>



<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="physician.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" maxlength="16" required="" value="${physicianInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="physician.middleName.label" default="Middle Name" />
		
	</label>
	<g:textField name="middleName" value="${physicianInstance?.middleName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="physician.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" maxlength="16" required="" value="${physicianInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'streetAdress1', 'error')} required">
	<label for="streetAdress1">
		<g:message code="physician.streetAdress1.label" default="Street Adress1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="streetAdress1" maxlength="32" required="" value="${physicianInstance?.streetAdress1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'streetAdress2', 'error')} ">
	<label for="streetAdress2">
		<g:message code="physician.streetAdress2.label" default="Street Adress2" />
		
	</label>
	<g:textField name="streetAdress2" value="${physicianInstance?.streetAdress2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="physician.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" maxlength="16" required="" value="${physicianInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="physician.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="state" maxlength="16" required="" value="${physicianInstance?.state}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="physician.country.label" default="Country" />
		
	</label>
	<g:textField name="country" maxlength="16" value="${physicianInstance?.country}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'phoneNumber', 'error')} ">
	<label for="phoneNumber">
		<g:message code="physician.phoneNumber.label" default="Phone Number" />
		
	</label>
	<g:textField name="phoneNumber" value="${physicianInstance?.phoneNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'credential', 'error')} ">
	<label for="credential">
		<g:message code="physician.credential.label" default="Credential" />
		
	</label>
	<g:textField name="credential" maxlength="16" value="${physicianInstance?.credential}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'npi', 'error')} required">
	<label for="npi">
		<g:message code="physician.npi.label" default="Npi" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="npi" maxlength="16" required="" value="${physicianInstance?.npi}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'prefix', 'error')} ">
	<label for="prefix">
		<g:message code="physician.prefix.label" default="Prefix" />
		
	</label>
	<g:textField name="prefix" value="${physicianInstance?.prefix}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'suffix', 'error')} ">
	<label for="suffix">
		<g:message code="physician.suffix.label" default="Suffix" />
		
	</label>
	<g:textField name="suffix" value="${physicianInstance?.suffix}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: physicianInstance, field: 'sites', 'error')} required">
	<label for="sites">
		<g:message code="physician.sites.label" default="Sites" />
		<span class="required-indicator">*</span>
	</label>
	

</div>

