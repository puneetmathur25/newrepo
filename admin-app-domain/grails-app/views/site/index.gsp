
<%@ page import="edu.osumc.bmi.ird.ready.Site" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'site.label', default: 'Site')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-site" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-site" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'site.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'site.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="greeting" title="${message(code: 'site.greeting.label', default: 'Greeting')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'site.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'site.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="site.institution.label" default="Institution" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${siteInstanceList}" status="i" var="siteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${siteInstance.id}">${fieldValue(bean: siteInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: siteInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: siteInstance, field: "greeting")}</td>
					
						<td><g:formatDate date="${siteInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${siteInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: siteInstance, field: "institution")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${siteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
