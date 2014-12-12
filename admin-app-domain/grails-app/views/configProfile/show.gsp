
<%@ page import="edu.osumc.bmi.ird.ready.ConfigProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configProfile.label', default: 'ConfigProfile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-configProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-configProfile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list configProfile">
			
				<g:if test="${configProfileInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="configProfile.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${configProfileInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.saveResults}">
				<li class="fieldcontain">
					<span id="saveResults-label" class="property-label"><g:message code="configProfile.saveResults.label" default="Save Results" /></span>
					
						<span class="property-value" aria-labelledby="saveResults-label"><g:formatBoolean boolean="${configProfileInstance?.saveResults}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.greeting}">
				<li class="fieldcontain">
					<span id="greeting-label" class="property-label"><g:message code="configProfile.greeting.label" default="Greeting" /></span>
					
						<span class="property-value" aria-labelledby="greeting-label"><g:fieldValue bean="${configProfileInstance}" field="greeting"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.lastPageText}">
				<li class="fieldcontain">
					<span id="lastPageText-label" class="property-label"><g:message code="configProfile.lastPageText.label" default="Last Page Text" /></span>
					
						<span class="property-value" aria-labelledby="lastPageText-label"><g:fieldValue bean="${configProfileInstance}" field="lastPageText"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.showScores}">
				<li class="fieldcontain">
					<span id="showScores-label" class="property-label"><g:message code="configProfile.showScores.label" default="Show Scores" /></span>
					
						<span class="property-value" aria-labelledby="showScores-label"><g:formatBoolean boolean="${configProfileInstance?.showScores}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.showRxPage}">
				<li class="fieldcontain">
					<span id="showRxPage-label" class="property-label"><g:message code="configProfile.showRxPage.label" default="Show Rx Page" /></span>
					
						<span class="property-value" aria-labelledby="showRxPage-label"><g:formatBoolean boolean="${configProfileInstance?.showRxPage}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="configProfile.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${configProfileInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="configProfile.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${configProfileInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.configProfileSiteMappings}">
				<li class="fieldcontain">
					<span id="configProfileSiteMappings-label" class="property-label"><g:message code="configProfile.configProfileSiteMappings.label" default="Config Profile Site Mappings" /></span>
					
						<g:each in="${configProfileInstance.configProfileSiteMappings}" var="c">
						<span class="property-value" aria-labelledby="configProfileSiteMappings-label"><g:link controller="siteConfigProfileMapping" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.cpInstDiagMapping}">
				<li class="fieldcontain">
					<span id="cpInstDiagMapping-label" class="property-label"><g:message code="configProfile.cpInstDiagMapping.label" default="Cp Inst Diag Mapping" /></span>
					
						<g:each in="${configProfileInstance.cpInstDiagMapping}" var="c">
						<span class="property-value" aria-labelledby="cpInstDiagMapping-label"><g:link controller="configProfileInstrumentDiagnosisMapping" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.gettingBetterPictograph}">
				<li class="fieldcontain">
					<span id="gettingBetterPictograph-label" class="property-label"><g:message code="configProfile.gettingBetterPictograph.label" default="Getting Better Pictograph" /></span>
					
						<span class="property-value" aria-labelledby="gettingBetterPictograph-label"><g:link controller="pictograph" action="show" id="${configProfileInstance?.gettingBetterPictograph?.id}">${configProfileInstance?.gettingBetterPictograph?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.sideEffectPictograph}">
				<li class="fieldcontain">
					<span id="sideEffectPictograph-label" class="property-label"><g:message code="configProfile.sideEffectPictograph.label" default="Side Effect Pictograph" /></span>
					
						<span class="property-value" aria-labelledby="sideEffectPictograph-label"><g:link controller="pictograph" action="show" id="${configProfileInstance?.sideEffectPictograph?.id}">${configProfileInstance?.sideEffectPictograph?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.seriousSideEffectPictograph}">
				<li class="fieldcontain">
					<span id="seriousSideEffectPictograph-label" class="property-label"><g:message code="configProfile.seriousSideEffectPictograph.label" default="Serious Side Effect Pictograph" /></span>
					
						<span class="property-value" aria-labelledby="seriousSideEffectPictograph-label"><g:link controller="pictograph" action="show" id="${configProfileInstance?.seriousSideEffectPictograph?.id}">${configProfileInstance?.seriousSideEffectPictograph?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.gettingBetterPictographEnabled}">
				<li class="fieldcontain">
					<span id="gettingBetterPictographEnabled-label" class="property-label"><g:message code="configProfile.gettingBetterPictographEnabled.label" default="Getting Better Pictograph Enabled" /></span>
					
						<span class="property-value" aria-labelledby="gettingBetterPictographEnabled-label"><g:formatBoolean boolean="${configProfileInstance?.gettingBetterPictographEnabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.seriousSideEffectPictographEnabled}">
				<li class="fieldcontain">
					<span id="seriousSideEffectPictographEnabled-label" class="property-label"><g:message code="configProfile.seriousSideEffectPictographEnabled.label" default="Serious Side Effect Pictograph Enabled" /></span>
					
						<span class="property-value" aria-labelledby="seriousSideEffectPictographEnabled-label"><g:formatBoolean boolean="${configProfileInstance?.seriousSideEffectPictographEnabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${configProfileInstance?.sideEffectPictographEnabled}">
				<li class="fieldcontain">
					<span id="sideEffectPictographEnabled-label" class="property-label"><g:message code="configProfile.sideEffectPictographEnabled.label" default="Side Effect Pictograph Enabled" /></span>
					
						<span class="property-value" aria-labelledby="sideEffectPictographEnabled-label"><g:formatBoolean boolean="${configProfileInstance?.sideEffectPictographEnabled}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:configProfileInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${configProfileInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
