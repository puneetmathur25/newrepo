
<%@ page import="edu.osumc.bmi.ird.ready.LikertScale" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'likertScale.label', default: 'LikertScale')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-likertScale" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-likertScale" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list likertScale">
			
				<g:if test="${likertScaleInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="likertScale.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${likertScaleInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${likertScaleInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="likertScale.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${likertScaleInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${likertScaleInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="likertScale.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${likertScaleInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${likertScaleInstance?.responseOptions}">
				<li class="fieldcontain">
					<span id="responseOptions-label" class="property-label"><g:message code="likertScale.responseOptions.label" default="Response Options" /></span>
					
						<g:each in="${likertScaleInstance.responseOptions}" var="r">
						<span class="property-value" aria-labelledby="responseOptions-label"><g:link controller="responseOption" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:likertScaleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${likertScaleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
