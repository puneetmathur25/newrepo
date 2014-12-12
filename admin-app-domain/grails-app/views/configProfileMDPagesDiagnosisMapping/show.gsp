
<%@ page import="edu.osumc.bmi.ird.ready.ConfigProfileMDPagesDiagnosisMapping" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configProfileMDPagesDiagnosisMapping.label', default: 'ConfigProfileMDPagesDiagnosisMapping')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-configProfileMDPagesDiagnosisMapping" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-configProfileMDPagesDiagnosisMapping" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list configProfileMDPagesDiagnosisMapping">
			
				<g:if test="${configProfileMDPagesDiagnosisMappingInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="configProfileMDPagesDiagnosisMapping.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${configProfileMDPagesDiagnosisMappingInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileMDPagesDiagnosisMappingInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="configProfileMDPagesDiagnosisMapping.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${configProfileMDPagesDiagnosisMappingInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileMDPagesDiagnosisMappingInstance?.configProfile}">
				<li class="fieldcontain">
					<span id="configProfile-label" class="property-label"><g:message code="configProfileMDPagesDiagnosisMapping.configProfile.label" default="Config Profile" /></span>
					
						<span class="property-value" aria-labelledby="configProfile-label"><g:link controller="configProfile" action="show" id="${configProfileMDPagesDiagnosisMappingInstance?.configProfile?.id}">${configProfileMDPagesDiagnosisMappingInstance?.configProfile?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileMDPagesDiagnosisMappingInstance?.diagnosis}">
				<li class="fieldcontain">
					<span id="diagnosis-label" class="property-label"><g:message code="configProfileMDPagesDiagnosisMapping.diagnosis.label" default="Diagnosis" /></span>
					
						<span class="property-value" aria-labelledby="diagnosis-label"><g:link controller="diagnosis" action="show" id="${configProfileMDPagesDiagnosisMappingInstance?.diagnosis?.id}">${configProfileMDPagesDiagnosisMappingInstance?.diagnosis?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileMDPagesDiagnosisMappingInstance?.mdPage}">
				<li class="fieldcontain">
					<span id="mdPage-label" class="property-label"><g:message code="configProfileMDPagesDiagnosisMapping.mdPage.label" default="Md Page" /></span>
					
						<span class="property-value" aria-labelledby="mdPage-label"><g:link controller="MDPage" action="show" id="${configProfileMDPagesDiagnosisMappingInstance?.mdPage?.id}">${configProfileMDPagesDiagnosisMappingInstance?.mdPage?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileMDPagesDiagnosisMappingInstance?.mdPageDiagnosisEnabled}">
				<li class="fieldcontain">
					<span id="mdPageDiagnosisEnabled-label" class="property-label"><g:message code="configProfileMDPagesDiagnosisMapping.mdPageDiagnosisEnabled.label" default="Md Page Diagnosis Enabled" /></span>
					
						<span class="property-value" aria-labelledby="mdPageDiagnosisEnabled-label"><g:formatBoolean boolean="${configProfileMDPagesDiagnosisMappingInstance?.mdPageDiagnosisEnabled}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:configProfileMDPagesDiagnosisMappingInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${configProfileMDPagesDiagnosisMappingInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
