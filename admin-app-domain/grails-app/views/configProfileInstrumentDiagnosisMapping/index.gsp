
<%@ page import="edu.osumc.bmi.ird.ready.ConfigProfileInstrumentDiagnosisMapping" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configProfileInstrumentDiagnosisMapping.label', default: 'ConfigProfileInstrumentDiagnosisMapping')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-configProfileInstrumentDiagnosisMapping" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-configProfileInstrumentDiagnosisMapping" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'configProfileInstrumentDiagnosisMapping.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'configProfileInstrumentDiagnosisMapping.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="configProfileInstrumentDiagnosisMapping.configProfile.label" default="Config Profile" /></th>
					
						<th><g:message code="configProfileInstrumentDiagnosisMapping.diagnosis.label" default="Diagnosis" /></th>
					
						<th><g:message code="configProfileInstrumentDiagnosisMapping.instrument.label" default="Instrument" /></th>
					
						<g:sortableColumn property="instrumentDiagnosisEnabled" title="${message(code: 'configProfileInstrumentDiagnosisMapping.instrumentDiagnosisEnabled.label', default: 'Instrument Diagnosis Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${configProfileInstrumentDiagnosisMappingInstanceList}" status="i" var="configProfileInstrumentDiagnosisMappingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${configProfileInstrumentDiagnosisMappingInstance.id}">${fieldValue(bean: configProfileInstrumentDiagnosisMappingInstance, field: "dateCreated")}</g:link></td>
					
						<td><g:formatDate date="${configProfileInstrumentDiagnosisMappingInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: configProfileInstrumentDiagnosisMappingInstance, field: "configProfile")}</td>
					
						<td>${fieldValue(bean: configProfileInstrumentDiagnosisMappingInstance, field: "diagnosis")}</td>
					
						<td>${fieldValue(bean: configProfileInstrumentDiagnosisMappingInstance, field: "instrument")}</td>
					
						<td><g:formatBoolean boolean="${configProfileInstrumentDiagnosisMappingInstance.instrumentDiagnosisEnabled}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${configProfileInstrumentDiagnosisMappingInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
