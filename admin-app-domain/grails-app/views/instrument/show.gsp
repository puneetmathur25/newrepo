
<%@ page import="edu.osumc.bmi.ird.ready.Instrument" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'instrument.label', default: 'Instrument')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-instrument" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-instrument" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list instrument">
			
				<g:if test="${instrumentInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="instrument.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${instrumentInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instrumentInstance?.defaultQuestionText}">
				<li class="fieldcontain">
					<span id="defaultQuestionText-label" class="property-label"><g:message code="instrument.defaultQuestionText.label" default="Default Question Text" /></span>
					
						<span class="property-value" aria-labelledby="defaultQuestionText-label"><g:fieldValue bean="${instrumentInstance}" field="defaultQuestionText"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instrumentInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="instrument.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${instrumentInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${instrumentInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="instrument.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${instrumentInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${instrumentInstance?.questions}">
				<li class="fieldcontain">
					<span id="questions-label" class="property-label"><g:message code="instrument.questions.label" default="Questions" /></span>
					
						<g:each in="${instrumentInstance.questions}" var="q">
						<span class="property-value" aria-labelledby="questions-label"><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${instrumentInstance?.diagnoses}">
				<li class="fieldcontain">
					<span id="diagnoses-label" class="property-label"><g:message code="instrument.diagnoses.label" default="Diagnoses" /></span>
					
						<g:each in="${instrumentInstance.diagnoses}" var="d">
						<span class="property-value" aria-labelledby="diagnoses-label"><g:link controller="diagnosis" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:instrumentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${instrumentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
