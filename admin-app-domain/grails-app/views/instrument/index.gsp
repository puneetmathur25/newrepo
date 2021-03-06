
<%@ page import="edu.osumc.bmi.ird.ready.Instrument" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'instrument.label', default: 'Instrument')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-instrument" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-instrument" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'instrument.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="instrumentType" title="${message(code: 'instrument.instrumentType.label', default: 'Instrument Type')}" />
					
						<g:sortableColumn property="defaultQuestionText" title="${message(code: 'instrument.defaultQuestionText.label', default: 'Default Question Text')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'instrument.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'instrument.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${instrumentInstanceList}" status="i" var="instrumentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${instrumentInstance.id}">${fieldValue(bean: instrumentInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: instrumentInstance, field: "instrumentType")}</td>
					
						<td>${fieldValue(bean: instrumentInstance, field: "defaultQuestionText")}</td>
					
						<td><g:formatDate date="${instrumentInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${instrumentInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${instrumentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
