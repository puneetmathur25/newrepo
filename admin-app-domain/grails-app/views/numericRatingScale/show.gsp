
<%@ page import="edu.osumc.bmi.ird.ready.NumericRatingScale" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'numericRatingScale.label', default: 'NumericRatingScale')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-numericRatingScale" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-numericRatingScale" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list numericRatingScale">
			
				<g:if test="${numericRatingScaleInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="numericRatingScale.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${numericRatingScaleInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${numericRatingScaleInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="numericRatingScale.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${numericRatingScaleInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${numericRatingScaleInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="numericRatingScale.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${numericRatingScaleInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${numericRatingScaleInstance?.minLevelLabel}">
				<li class="fieldcontain">
					<span id="minLevelLabel-label" class="property-label"><g:message code="numericRatingScale.minLevelLabel.label" default="Min Level Label" /></span>
					
						<span class="property-value" aria-labelledby="minLevelLabel-label"><g:fieldValue bean="${numericRatingScaleInstance}" field="minLevelLabel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${numericRatingScaleInstance?.minLevelValue}">
				<li class="fieldcontain">
					<span id="minLevelValue-label" class="property-label"><g:message code="numericRatingScale.minLevelValue.label" default="Min Level Value" /></span>
					
						<span class="property-value" aria-labelledby="minLevelValue-label"><g:fieldValue bean="${numericRatingScaleInstance}" field="minLevelValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${numericRatingScaleInstance?.maxLevelLabel}">
				<li class="fieldcontain">
					<span id="maxLevelLabel-label" class="property-label"><g:message code="numericRatingScale.maxLevelLabel.label" default="Max Level Label" /></span>
					
						<span class="property-value" aria-labelledby="maxLevelLabel-label"><g:fieldValue bean="${numericRatingScaleInstance}" field="maxLevelLabel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${numericRatingScaleInstance?.maxLevelValue}">
				<li class="fieldcontain">
					<span id="maxLevelValue-label" class="property-label"><g:message code="numericRatingScale.maxLevelValue.label" default="Max Level Value" /></span>
					
						<span class="property-value" aria-labelledby="maxLevelValue-label"><g:fieldValue bean="${numericRatingScaleInstance}" field="maxLevelValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${numericRatingScaleInstance?.increment}">
				<li class="fieldcontain">
					<span id="increment-label" class="property-label"><g:message code="numericRatingScale.increment.label" default="Increment" /></span>
					
						<span class="property-value" aria-labelledby="increment-label"><g:fieldValue bean="${numericRatingScaleInstance}" field="increment"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:numericRatingScaleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${numericRatingScaleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
