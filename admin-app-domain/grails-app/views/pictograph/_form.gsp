<%@ page import="edu.osumc.bmi.ird.ready.Pictograph" %>



<div class="fieldcontain ${hasErrors(bean: pictographInstance, field: 'maxPictoValue', 'error')} required">
	<label for="maxPictoValue">
		<g:message code="pictograph.maxPictoValue.label" default="Max Picto Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxPictoValue" type="number" value="${pictographInstance.maxPictoValue}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pictographInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="pictograph.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${pictographInstance?.label}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pictographInstance, field: 'negativePictoType', 'error')} required">
	<label for="negativePictoType">
		<g:message code="pictograph.negativePictoType.label" default="Negative Picto Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="negativePictoType" from="${edu.osumc.bmi.ird.ready.PictoTypes?.values()}" keys="${edu.osumc.bmi.ird.ready.PictoTypes.values()*.name()}" required="" value="${pictographInstance?.negativePictoType?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: pictographInstance, field: 'negativePictoValue', 'error')} required">
	<label for="negativePictoValue">
		<g:message code="pictograph.negativePictoValue.label" default="Negative Picto Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="negativePictoValue" type="number" value="${pictographInstance.negativePictoValue}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pictographInstance, field: 'positivePictoType', 'error')} required">
	<label for="positivePictoType">
		<g:message code="pictograph.positivePictoType.label" default="Positive Picto Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="positivePictoType" from="${edu.osumc.bmi.ird.ready.PictoTypes?.values()}" keys="${edu.osumc.bmi.ird.ready.PictoTypes.values()*.name()}" required="" value="${pictographInstance?.positivePictoType?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: pictographInstance, field: 'positivePictoValue', 'error')} required">
	<label for="positivePictoValue">
		<g:message code="pictograph.positivePictoValue.label" default="Positive Picto Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="positivePictoValue" type="number" value="${pictographInstance.positivePictoValue}" required=""/>

</div>

