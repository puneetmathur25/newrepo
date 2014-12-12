<%@ page import="edu.osumc.bmi.ird.ready.Site" %>



<div class="fieldcontain ${hasErrors(bean: siteInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="site.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" maxlength="16" required="" value="${siteInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: siteInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="site.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" maxlength="16" required="" value="${siteInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: siteInstance, field: 'greeting', 'error')} ">
	<label for="greeting">
		<g:message code="site.greeting.label" default="Greeting" />
		
	</label>
	<g:textArea name="greeting" cols="40" rows="5" maxlength="256" value="${siteInstance?.greeting}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: siteInstance, field: 'institution', 'error')} required">
	<label for="institution">
		<g:message code="site.institution.label" default="Institution" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="institution" name="institution.id" from="${edu.osumc.bmi.ird.ready.Institution.list()}" optionKey="id" required="" value="${siteInstance?.institution?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: siteInstance, field: 'physicians', 'error')} ">
	<label for="physicians">
		<g:message code="site.physicians.label" default="Physicians" />
		
	</label>
	<g:select name="physicians" from="${edu.osumc.bmi.ird.ready.Physician.list()}" multiple="multiple" optionKey="id" size="5" value="${siteInstance?.physicians*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: siteInstance, field: 'siteConfigProfileMappings', 'error')} ">
	<label for="siteConfigProfileMappings">
		<g:message code="site.siteConfigProfileMappings.label" default="Site Config Profile Mappings" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${siteInstance?.siteConfigProfileMappings?}" var="s">
    <li><g:link controller="siteConfigProfileMapping" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="siteConfigProfileMapping" action="create" params="['site.id': siteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'siteConfigProfileMapping.label', default: 'SiteConfigProfileMapping')])}</g:link>
</li>
</ul>


</div>

