
<%@ page import="edu.osumc.bmi.ird.ready.NumericRatingScale" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'numericRatingScale.label', default: 'NumericRatingScale')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-numericRatingScale" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-numericRatingScale" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'numericRatingScale.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'numericRatingScale.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'numericRatingScale.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="minLevelLabel" title="${message(code: 'numericRatingScale.minLevelLabel.label', default: 'Min Level Label')}" />
					
						<g:sortableColumn property="minLevelValue" title="${message(code: 'numericRatingScale.minLevelValue.label', default: 'Min Level Value')}" />
					
						<g:sortableColumn property="maxLevelLabel" title="${message(code: 'numericRatingScale.maxLevelLabel.label', default: 'Max Level Label')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${numericRatingScaleInstanceList}" status="i" var="numericRatingScaleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${numericRatingScaleInstance.id}">${fieldValue(bean: numericRatingScaleInstance, field: "name")}</g:link></td>
					
						<td><g:formatDate date="${numericRatingScaleInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${numericRatingScaleInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: numericRatingScaleInstance, field: "minLevelLabel")}</td>
					
						<td>${fieldValue(bean: numericRatingScaleInstance, field: "minLevelValue")}</td>
					
						<td>${fieldValue(bean: numericRatingScaleInstance, field: "maxLevelLabel")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${numericRatingScaleInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
