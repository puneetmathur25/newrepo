
<%@ page import="edu.osumc.bmi.ird.ready.SiteConfigProfileMapping" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'siteConfigProfileMapping.label', default: 'SiteConfigProfileMapping')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-siteConfigProfileMapping" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-siteConfigProfileMapping" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list siteConfigProfileMapping">
			
				<g:if test="${siteConfigProfileMappingInstance?.site}">
				<li class="fieldcontain">
					<span id="site-label" class="property-label"><g:message code="siteConfigProfileMapping.site.label" default="Site" /></span>
					
						<span class="property-value" aria-labelledby="site-label"><g:link controller="site" action="show" id="${siteConfigProfileMappingInstance?.site?.id}">${siteConfigProfileMappingInstance?.site?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteConfigProfileMappingInstance?.configProfile}">
				<li class="fieldcontain">
					<span id="configProfile-label" class="property-label"><g:message code="siteConfigProfileMapping.configProfile.label" default="Config Profile" /></span>
					
						<span class="property-value" aria-labelledby="configProfile-label"><g:link controller="configProfile" action="show" id="${siteConfigProfileMappingInstance?.configProfile?.id}">${siteConfigProfileMappingInstance?.configProfile?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteConfigProfileMappingInstance?.defaultConfigProfile}">
				<li class="fieldcontain">
					<span id="defaultConfigProfile-label" class="property-label"><g:message code="siteConfigProfileMapping.defaultConfigProfile.label" default="Default Config Profile" /></span>
					
						<span class="property-value" aria-labelledby="defaultConfigProfile-label"><g:formatBoolean boolean="${siteConfigProfileMappingInstance?.defaultConfigProfile}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteConfigProfileMappingInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="siteConfigProfileMapping.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${siteConfigProfileMappingInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${siteConfigProfileMappingInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="siteConfigProfileMapping.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${siteConfigProfileMappingInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:siteConfigProfileMappingInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${siteConfigProfileMappingInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
