
<%@ page import="edu.osumc.bmi.ird.ready.Institution" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'institution.label', default: 'Institution')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-institution" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-institution" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list institution">
			
				<g:if test="${institutionInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="institution.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${institutionInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.streetAddress1}">
				<li class="fieldcontain">
					<span id="streetAddress1-label" class="property-label"><g:message code="institution.streetAddress1.label" default="Street Address1" /></span>
					
						<span class="property-value" aria-labelledby="streetAddress1-label"><g:fieldValue bean="${institutionInstance}" field="streetAddress1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.streetAddress2}">
				<li class="fieldcontain">
					<span id="streetAddress2-label" class="property-label"><g:message code="institution.streetAddress2.label" default="Street Address2" /></span>
					
						<span class="property-value" aria-labelledby="streetAddress2-label"><g:fieldValue bean="${institutionInstance}" field="streetAddress2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="institution.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${institutionInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="institution.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${institutionInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="institution.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${institutionInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.zipcode}">
				<li class="fieldcontain">
					<span id="zipcode-label" class="property-label"><g:message code="institution.zipcode.label" default="Zipcode" /></span>
					
						<span class="property-value" aria-labelledby="zipcode-label"><g:fieldValue bean="${institutionInstance}" field="zipcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.phoneNumber}">
				<li class="fieldcontain">
					<span id="phoneNumber-label" class="property-label"><g:message code="institution.phoneNumber.label" default="Phone Number" /></span>
					
						<span class="property-value" aria-labelledby="phoneNumber-label"><g:fieldValue bean="${institutionInstance}" field="phoneNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="institution.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${institutionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="institution.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${institutionInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:institutionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${institutionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
