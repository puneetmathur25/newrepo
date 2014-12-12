<%@ page import="edu.osumc.bmi.ird.ready.ConfigProfile" %>



<div class="fieldcontain ${hasErrors(bean: configProfileInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="configProfile.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="16" required="" value="${configProfileInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstance, field: 'saveResults', 'error')} ">
	<label for="saveResults">
		<g:message code="configProfile.saveResults.label" default="Save Results" />
		
	</label>
	<g:checkBox name="saveResults" value="${configProfileInstance?.saveResults}" />

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstance, field: 'greeting', 'error')} ">
	<label for="greeting">
		<g:message code="configProfile.greeting.label" default="Greeting" />
		
	</label>
	<g:textArea name="greeting" cols="40" rows="5" maxlength="256" value="${configProfileInstance?.greeting}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstance, field: 'lastPageText', 'error')} ">
	<label for="lastPageText">
		<g:message code="configProfile.lastPageText.label" default="Last Page Text" />
		
	</label>
	<g:textArea name="lastPageText" cols="40" rows="5" maxlength="256" value="${configProfileInstance?.lastPageText}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstance, field: 'showScores', 'error')} ">
	<label for="showScores">
		<g:message code="configProfile.showScores.label" default="Show Scores" />
		
	</label>
	<g:checkBox name="showScores" value="${configProfileInstance?.showScores}" />

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstance, field: 'showRxPage', 'error')} ">
	<label for="showRxPage">
		<g:message code="configProfile.showRxPage.label" default="Show Rx Page" />
		
	</label>
	<g:checkBox name="showRxPage" value="${configProfileInstance?.showRxPage}" />

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstance, field: 'configProfileSiteMappings', 'error')} ">
	<label for="configProfileSiteMappings">
		<g:message code="configProfile.configProfileSiteMappings.label" default="Config Profile Site Mappings" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${configProfileInstance?.configProfileSiteMappings?}" var="c">
    <li><g:link controller="siteConfigProfileMapping" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="siteConfigProfileMapping" action="create" params="['configProfile.id': configProfileInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'siteConfigProfileMapping.label', default: 'SiteConfigProfileMapping')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstance, field: 'cpInstDiagMapping', 'error')} ">
	<label for="cpInstDiagMapping">
		<g:message code="configProfile.cpInstDiagMapping.label" default="Cp Inst Diag Mapping" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${configProfileInstance?.cpInstDiagMapping?}" var="c">
    <li><g:link controller="configProfileInstrumentDiagnosisMapping" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="configProfileInstrumentDiagnosisMapping" action="create" params="['configProfile.id': configProfileInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'configProfileInstrumentDiagnosisMapping.label', default: 'ConfigProfileInstrumentDiagnosisMapping')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstance, field: 'gettingBetterPictograph', 'error')} ">
	<label for="gettingBetterPictograph">
		<g:message code="configProfile.gettingBetterPictograph.label" default="Getting Better Pictograph" />
		
	</label>
	<g:select id="gettingBetterPictograph" name="gettingBetterPictograph.id" from="${edu.osumc.bmi.ird.ready.Pictograph.list()}" optionKey="id" value="${configProfileInstance?.gettingBetterPictograph?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstance, field: 'sideEffectPictograph', 'error')} ">
	<label for="sideEffectPictograph">
		<g:message code="configProfile.sideEffectPictograph.label" default="Side Effect Pictograph" />
		
	</label>
	<g:select id="sideEffectPictograph" name="sideEffectPictograph.id" from="${edu.osumc.bmi.ird.ready.Pictograph.list()}" optionKey="id" value="${configProfileInstance?.sideEffectPictograph?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstance, field: 'seriousSideEffectPictograph', 'error')} ">
	<label for="seriousSideEffectPictograph">
		<g:message code="configProfile.seriousSideEffectPictograph.label" default="Serious Side Effect Pictograph" />
		
	</label>
	<g:select id="seriousSideEffectPictograph" name="seriousSideEffectPictograph.id" from="${edu.osumc.bmi.ird.ready.Pictograph.list()}" optionKey="id" value="${configProfileInstance?.seriousSideEffectPictograph?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstance, field: 'gettingBetterPictographEnabled', 'error')} ">
	<label for="gettingBetterPictographEnabled">
		<g:message code="configProfile.gettingBetterPictographEnabled.label" default="Getting Better Pictograph Enabled" />
		
	</label>
	<g:checkBox name="gettingBetterPictographEnabled" value="${configProfileInstance?.gettingBetterPictographEnabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstance, field: 'seriousSideEffectPictographEnabled', 'error')} ">
	<label for="seriousSideEffectPictographEnabled">
		<g:message code="configProfile.seriousSideEffectPictographEnabled.label" default="Serious Side Effect Pictograph Enabled" />
		
	</label>
	<g:checkBox name="seriousSideEffectPictographEnabled" value="${configProfileInstance?.seriousSideEffectPictographEnabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: configProfileInstance, field: 'sideEffectPictographEnabled', 'error')} ">
	<label for="sideEffectPictographEnabled">
		<g:message code="configProfile.sideEffectPictographEnabled.label" default="Side Effect Pictograph Enabled" />
		
	</label>
	<g:checkBox name="sideEffectPictographEnabled" value="${configProfileInstance?.sideEffectPictographEnabled}" />

</div>

