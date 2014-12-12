
<%@ page import="edu.osumc.bmi.ird.ready.ConfigProfileInstrumentDiagnosisMapping" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configProfileInstrumentDiagnosisMapping.label', default: 'ConfigProfileInstrumentDiagnosisMapping')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-configProfileInstrumentDiagnosisMapping" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-configProfileInstrumentDiagnosisMapping" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list configProfileInstrumentDiagnosisMapping">
			
				<g:if test="${configProfileInstrumentDiagnosisMappingInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="configProfileInstrumentDiagnosisMapping.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${configProfileInstrumentDiagnosisMappingInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstrumentDiagnosisMappingInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="configProfileInstrumentDiagnosisMapping.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${configProfileInstrumentDiagnosisMappingInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstrumentDiagnosisMappingInstance?.configProfile}">
				<li class="fieldcontain">
					<span id="configProfile-label" class="property-label"><g:message code="configProfileInstrumentDiagnosisMapping.configProfile.label" default="Config Profile" /></span>
					
						<span class="property-value" aria-labelledby="configProfile-label"><g:link controller="configProfile" action="show" id="${configProfileInstrumentDiagnosisMappingInstance?.configProfile?.id}">${configProfileInstrumentDiagnosisMappingInstance?.configProfile?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstrumentDiagnosisMappingInstance?.diagnosis}">
				<li class="fieldcontain">
					<span id="diagnosis-label" class="property-label"><g:message code="configProfileInstrumentDiagnosisMapping.diagnosis.label" default="Diagnosis" /></span>
					
						<span class="property-value" aria-labelledby="diagnosis-label"><g:link controller="diagnosis" action="show" id="${configProfileInstrumentDiagnosisMappingInstance?.diagnosis?.id}">${configProfileInstrumentDiagnosisMappingInstance?.diagnosis?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstrumentDiagnosisMappingInstance?.instrument}">
				<li class="fieldcontain">
					<span id="instrument-label" class="property-label"><g:message code="configProfileInstrumentDiagnosisMapping.instrument.label" default="Instrument" /></span>
					
						<span class="property-value" aria-labelledby="instrument-label"><g:link controller="instrument" action="show" id="${configProfileInstrumentDiagnosisMappingInstance?.instrument?.id}">${configProfileInstrumentDiagnosisMappingInstance?.instrument?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstrumentDiagnosisMappingInstance?.instrumentDiagnosisEnabled}">
				<li class="fieldcontain">
					<span id="instrumentDiagnosisEnabled-label" class="property-label"><g:message code="configProfileInstrumentDiagnosisMapping.instrumentDiagnosisEnabled.label" default="Instrument Diagnosis Enabled" /></span>
					
						<span class="property-value" aria-labelledby="instrumentDiagnosisEnabled-label"><g:formatBoolean boolean="${configProfileInstrumentDiagnosisMappingInstance?.instrumentDiagnosisEnabled}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:configProfileInstrumentDiagnosisMappingInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${configProfileInstrumentDiagnosisMappingInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
