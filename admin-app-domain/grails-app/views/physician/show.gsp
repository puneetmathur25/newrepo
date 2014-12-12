
<%@ page import="edu.osumc.bmi.ird.ready.Physician" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'physician.label', default: 'Physician')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-physician" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-physician" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list physician">
			
				<g:if test="${physicianInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="physician.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${physicianInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.middleName}">
				<li class="fieldcontain">
					<span id="middleName-label" class="property-label"><g:message code="physician.middleName.label" default="Middle Name" /></span>
					
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${physicianInstance}" field="middleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="physician.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${physicianInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.streetAdress1}">
				<li class="fieldcontain">
					<span id="streetAdress1-label" class="property-label"><g:message code="physician.streetAdress1.label" default="Street Adress1" /></span>
					
						<span class="property-value" aria-labelledby="streetAdress1-label"><g:fieldValue bean="${physicianInstance}" field="streetAdress1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.streetAdress2}">
				<li class="fieldcontain">
					<span id="streetAdress2-label" class="property-label"><g:message code="physician.streetAdress2.label" default="Street Adress2" /></span>
					
						<span class="property-value" aria-labelledby="streetAdress2-label"><g:fieldValue bean="${physicianInstance}" field="streetAdress2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="physician.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${physicianInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="physician.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${physicianInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="physician.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${physicianInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.phoneNumber}">
				<li class="fieldcontain">
					<span id="phoneNumber-label" class="property-label"><g:message code="physician.phoneNumber.label" default="Phone Number" /></span>
					
						<span class="property-value" aria-labelledby="phoneNumber-label"><g:fieldValue bean="${physicianInstance}" field="phoneNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.credential}">
				<li class="fieldcontain">
					<span id="credential-label" class="property-label"><g:message code="physician.credential.label" default="Credential" /></span>
					
						<span class="property-value" aria-labelledby="credential-label"><g:fieldValue bean="${physicianInstance}" field="credential"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.npi}">
				<li class="fieldcontain">
					<span id="npi-label" class="property-label"><g:message code="physician.npi.label" default="Npi" /></span>
					
						<span class="property-value" aria-labelledby="npi-label"><g:fieldValue bean="${physicianInstance}" field="npi"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.prefix}">
				<li class="fieldcontain">
					<span id="prefix-label" class="property-label"><g:message code="physician.prefix.label" default="Prefix" /></span>
					
						<span class="property-value" aria-labelledby="prefix-label"><g:fieldValue bean="${physicianInstance}" field="prefix"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.suffix}">
				<li class="fieldcontain">
					<span id="suffix-label" class="property-label"><g:message code="physician.suffix.label" default="Suffix" /></span>
					
						<span class="property-value" aria-labelledby="suffix-label"><g:fieldValue bean="${physicianInstance}" field="suffix"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="physician.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${physicianInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="physician.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${physicianInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${physicianInstance?.sites}">
				<li class="fieldcontain">
					<span id="sites-label" class="property-label"><g:message code="physician.sites.label" default="Sites" /></span>
					
						<g:each in="${physicianInstance.sites}" var="s">
						<span class="property-value" aria-labelledby="sites-label"><g:link controller="site" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:physicianInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${physicianInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
