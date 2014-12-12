
<%@ page import="edu.osumc.bmi.ird.ready.Diagnosis" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'diagnosis.label', default: 'Diagnosis')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-diagnosis" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-diagnosis" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list diagnosis">
			
				<g:if test="${diagnosisInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="diagnosis.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${diagnosisInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${diagnosisInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="diagnosis.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${diagnosisInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${diagnosisInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="diagnosis.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${diagnosisInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${diagnosisInstance?.instruments}">
				<li class="fieldcontain">
					<span id="instruments-label" class="property-label"><g:message code="diagnosis.instruments.label" default="Instruments" /></span>
					
						<g:each in="${diagnosisInstance.instruments}" var="i">
						<span class="property-value" aria-labelledby="instruments-label"><g:link controller="instrument" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${diagnosisInstance?.mdPages}">
				<li class="fieldcontain">
					<span id="mdPages-label" class="property-label"><g:message code="diagnosis.mdPages.label" default="Md Pages" /></span>
					
						<g:each in="${diagnosisInstance.mdPages}" var="m">
						<span class="property-value" aria-labelledby="mdPages-label"><g:link controller="MDPage" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${diagnosisInstance?.rxStatus}">
				<li class="fieldcontain">
					<span id="rxStatus-label" class="property-label"><g:message code="diagnosis.rxStatus.label" default="Rx Status" /></span>
					
						<span class="property-value" aria-labelledby="rxStatus-label"><g:formatBoolean boolean="${diagnosisInstance?.rxStatus}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:diagnosisInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${diagnosisInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
