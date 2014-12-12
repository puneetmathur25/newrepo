
<%@ page import="edu.osumc.bmi.ird.ready.ConfigProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configProfile.label', default: 'ConfigProfile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-configProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-configProfile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'configProfile.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="saveResults" title="${message(code: 'configProfile.saveResults.label', default: 'Save Results')}" />
					
						<g:sortableColumn property="greeting" title="${message(code: 'configProfile.greeting.label', default: 'Greeting')}" />
					
						<g:sortableColumn property="lastPageText" title="${message(code: 'configProfile.lastPageText.label', default: 'Last Page Text')}" />
					
						<g:sortableColumn property="showScores" title="${message(code: 'configProfile.showScores.label', default: 'Show Scores')}" />
					
						<g:sortableColumn property="showRxPage" title="${message(code: 'configProfile.showRxPage.label', default: 'Show Rx Page')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${configProfileInstanceList}" status="i" var="configProfileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${configProfileInstance.id}">${fieldValue(bean: configProfileInstance, field: "name")}</g:link></td>
					
						<td><g:formatBoolean boolean="${configProfileInstance.saveResults}" /></td>
					
						<td>${fieldValue(bean: configProfileInstance, field: "greeting")}</td>
					
						<td>${fieldValue(bean: configProfileInstance, field: "lastPageText")}</td>
					
						<td><g:formatBoolean boolean="${configProfileInstance.showScores}" /></td>
					
						<td><g:formatBoolean boolean="${configProfileInstance.showRxPage}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${configProfileInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
