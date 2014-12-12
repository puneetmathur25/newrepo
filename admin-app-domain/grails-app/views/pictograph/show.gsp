
<%@ page import="edu.osumc.bmi.ird.ready.Pictograph" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pictograph.label', default: 'Pictograph')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pictograph" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pictograph" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pictograph">
			
				<g:if test="${pictographInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="pictograph.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${pictographInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pictographInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="pictograph.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${pictographInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pictographInstance?.maxPictoValue}">
				<li class="fieldcontain">
					<span id="maxPictoValue-label" class="property-label"><g:message code="pictograph.maxPictoValue.label" default="Max Picto Value" /></span>
					
						<span class="property-value" aria-labelledby="maxPictoValue-label"><g:fieldValue bean="${pictographInstance}" field="maxPictoValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pictographInstance?.label}">
				<li class="fieldcontain">
					<span id="label-label" class="property-label"><g:message code="pictograph.label.label" default="Label" /></span>
					
						<span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${pictographInstance}" field="label"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pictographInstance?.negativePictoType}">
				<li class="fieldcontain">
					<span id="negativePictoType-label" class="property-label"><g:message code="pictograph.negativePictoType.label" default="Negative Picto Type" /></span>
					
						<span class="property-value" aria-labelledby="negativePictoType-label"><g:fieldValue bean="${pictographInstance}" field="negativePictoType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pictographInstance?.negativePictoValue}">
				<li class="fieldcontain">
					<span id="negativePictoValue-label" class="property-label"><g:message code="pictograph.negativePictoValue.label" default="Negative Picto Value" /></span>
					
						<span class="property-value" aria-labelledby="negativePictoValue-label"><g:fieldValue bean="${pictographInstance}" field="negativePictoValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pictographInstance?.positivePictoType}">
				<li class="fieldcontain">
					<span id="positivePictoType-label" class="property-label"><g:message code="pictograph.positivePictoType.label" default="Positive Picto Type" /></span>
					
						<span class="property-value" aria-labelledby="positivePictoType-label"><g:fieldValue bean="${pictographInstance}" field="positivePictoType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pictographInstance?.positivePictoValue}">
				<li class="fieldcontain">
					<span id="positivePictoValue-label" class="property-label"><g:message code="pictograph.positivePictoValue.label" default="Positive Picto Value" /></span>
					
						<span class="property-value" aria-labelledby="positivePictoValue-label"><g:fieldValue bean="${pictographInstance}" field="positivePictoValue"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:pictographInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${pictographInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
