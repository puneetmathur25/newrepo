
<%@ page import="edu.osumc.bmi.ird.ready.ConfigProfileMDPagesDiagnosisMapping" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configProfileMDPagesDiagnosisMapping.label', default: 'ConfigProfileMDPagesDiagnosisMapping')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-configProfileMDPagesDiagnosisMapping" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-configProfileMDPagesDiagnosisMapping" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'configProfileMDPagesDiagnosisMapping.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'configProfileMDPagesDiagnosisMapping.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="configProfileMDPagesDiagnosisMapping.configProfile.label" default="Config Profile" /></th>
					
						<th><g:message code="configProfileMDPagesDiagnosisMapping.diagnosis.label" default="Diagnosis" /></th>
					
						<th><g:message code="configProfileMDPagesDiagnosisMapping.mdPage.label" default="Md Page" /></th>
					
						<g:sortableColumn property="mdPageDiagnosisEnabled" title="${message(code: 'configProfileMDPagesDiagnosisMapping.mdPageDiagnosisEnabled.label', default: 'Md Page Diagnosis Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${configProfileMDPagesDiagnosisMappingInstanceList}" status="i" var="configProfileMDPagesDiagnosisMappingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${configProfileMDPagesDiagnosisMappingInstance.id}">${fieldValue(bean: configProfileMDPagesDiagnosisMappingInstance, field: "dateCreated")}</g:link></td>
					
						<td><g:formatDate date="${configProfileMDPagesDiagnosisMappingInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: configProfileMDPagesDiagnosisMappingInstance, field: "configProfile")}</td>
					
						<td>${fieldValue(bean: configProfileMDPagesDiagnosisMappingInstance, field: "diagnosis")}</td>
					
						<td>${fieldValue(bean: configProfileMDPagesDiagnosisMappingInstance, field: "mdPage")}</td>
					
						<td><g:formatBoolean boolean="${configProfileMDPagesDiagnosisMappingInstance.mdPageDiagnosisEnabled}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${configProfileMDPagesDiagnosisMappingInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
