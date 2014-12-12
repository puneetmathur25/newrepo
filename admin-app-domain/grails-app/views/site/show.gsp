
<%@ page import="edu.osumc.bmi.ird.ready.Site" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'site.label', default: 'Site')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-site" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-site" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list site">
			
				<g:if test="${siteInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="site.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${siteInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="site.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${siteInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteInstance?.greeting}">
				<li class="fieldcontain">
					<span id="greeting-label" class="property-label"><g:message code="site.greeting.label" default="Greeting" /></span>
					
						<span class="property-value" aria-labelledby="greeting-label"><g:fieldValue bean="${siteInstance}" field="greeting"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="site.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${siteInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="site.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${siteInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteInstance?.institution}">
				<li class="fieldcontain">
					<span id="institution-label" class="property-label"><g:message code="site.institution.label" default="Institution" /></span>
					
						<span class="property-value" aria-labelledby="institution-label"><g:link controller="institution" action="show" id="${siteInstance?.institution?.id}">${siteInstance?.institution?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteInstance?.physicians}">
				<li class="fieldcontain">
					<span id="physicians-label" class="property-label"><g:message code="site.physicians.label" default="Physicians" /></span>
					
						<g:each in="${siteInstance.physicians}" var="p">
						<span class="property-value" aria-labelledby="physicians-label"><g:link controller="physician" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${siteInstance?.siteConfigProfileMappings}">
				<li class="fieldcontain">
					<span id="siteConfigProfileMappings-label" class="property-label"><g:message code="site.siteConfigProfileMappings.label" default="Site Config Profile Mappings" /></span>
					
						<g:each in="${siteInstance.siteConfigProfileMappings}" var="s">
						<span class="property-value" aria-labelledby="siteConfigProfileMappings-label"><g:link controller="siteConfigProfileMapping" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:siteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${siteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
