
<%@ page import="edu.osumc.bmi.ird.ready.SiteConfigProfileMapping" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteConfigProfileMapping.label', default: 'SiteConfigProfileMapping')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-siteConfigProfileMapping" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-siteConfigProfileMapping" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="siteConfigProfileMapping.site.label" default="Site" /></th>
					
						<th><g:message code="siteConfigProfileMapping.configProfile.label" default="Config Profile" /></th>
					
						<g:sortableColumn property="defaultConfigProfile" title="${message(code: 'siteConfigProfileMapping.defaultConfigProfile.label', default: 'Default Config Profile')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'siteConfigProfileMapping.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'siteConfigProfileMapping.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${siteConfigProfileMappingInstanceList}" status="i" var="siteConfigProfileMappingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${siteConfigProfileMappingInstance.id}">${fieldValue(bean: siteConfigProfileMappingInstance, field: "site")}</g:link></td>
					
						<td>${fieldValue(bean: siteConfigProfileMappingInstance, field: "configProfile")}</td>
					
						<td><g:formatBoolean boolean="${siteConfigProfileMappingInstance.defaultConfigProfile}" /></td>
					
						<td><g:formatDate date="${siteConfigProfileMappingInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${siteConfigProfileMappingInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${siteConfigProfileMappingInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
