
<%@ page import="edu.osumc.bmi.ird.ready.Pictograph" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pictograph.label', default: 'Pictograph')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pictograph" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pictograph" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'pictograph.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'pictograph.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="maxPictoValue" title="${message(code: 'pictograph.maxPictoValue.label', default: 'Max Picto Value')}" />
					
						<g:sortableColumn property="label" title="${message(code: 'pictograph.label.label', default: 'Label')}" />
					
						<g:sortableColumn property="negativePictoType" title="${message(code: 'pictograph.negativePictoType.label', default: 'Negative Picto Type')}" />
					
						<g:sortableColumn property="negativePictoValue" title="${message(code: 'pictograph.negativePictoValue.label', default: 'Negative Picto Value')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pictographInstanceList}" status="i" var="pictographInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pictographInstance.id}">${fieldValue(bean: pictographInstance, field: "dateCreated")}</g:link></td>
					
						<td><g:formatDate date="${pictographInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: pictographInstance, field: "maxPictoValue")}</td>
					
						<td>${fieldValue(bean: pictographInstance, field: "label")}</td>
					
						<td>${fieldValue(bean: pictographInstance, field: "negativePictoType")}</td>
					
						<td>${fieldValue(bean: pictographInstance, field: "negativePictoValue")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pictographInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
