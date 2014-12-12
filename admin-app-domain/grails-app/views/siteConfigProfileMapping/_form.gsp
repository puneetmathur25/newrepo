<%@ page import="edu.osumc.bmi.ird.ready.SiteConfigProfileMapping" %>



<div class="fieldcontain ${hasErrors(bean: siteConfigProfileMappingInstance, field: 'site', 'error')} required">
	<label for="site">
		<g:message code="siteConfigProfileMapping.site.label" default="Site" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="site" name="site.id" from="${edu.osumc.bmi.ird.ready.Site.list()}" optionKey="id" required="" value="${siteConfigProfileMappingInstance?.site?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: siteConfigProfileMappingInstance, field: 'configProfile', 'error')} required">
	<label for="configProfile">
		<g:message code="siteConfigProfileMapping.configProfile.label" default="Config Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="configProfile" name="configProfile.id" from="${edu.osumc.bmi.ird.ready.ConfigProfile.list()}" optionKey="id" required="" value="${siteConfigProfileMappingInstance?.configProfile?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: siteConfigProfileMappingInstance, field: 'defaultConfigProfile', 'error')} ">
	<label for="defaultConfigProfile">
		<g:message code="siteConfigProfileMapping.defaultConfigProfile.label" default="Default Config Profile" />
		
	</label>
	<g:checkBox name="defaultConfigProfile" value="${siteConfigProfileMappingInstance?.defaultConfigProfile}" />

</div>

