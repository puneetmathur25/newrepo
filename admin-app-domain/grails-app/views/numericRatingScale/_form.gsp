<%@ page import="edu.osumc.bmi.ird.ready.NumericRatingScale" %>



<div class="fieldcontain ${hasErrors(bean: numericRatingScaleInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="numericRatingScale.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="64" required="" value="${numericRatingScaleInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: numericRatingScaleInstance, field: 'minLevelLabel', 'error')} required">
	<label for="minLevelLabel">
		<g:message code="numericRatingScale.minLevelLabel.label" default="Min Level Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="minLevelLabel" required="" value="${numericRatingScaleInstance?.minLevelLabel}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: numericRatingScaleInstance, field: 'minLevelValue', 'error')} required">
	<label for="minLevelValue">
		<g:message code="numericRatingScale.minLevelValue.label" default="Min Level Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="minLevelValue" type="number" value="${numericRatingScaleInstance.minLevelValue}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: numericRatingScaleInstance, field: 'maxLevelLabel', 'error')} required">
	<label for="maxLevelLabel">
		<g:message code="numericRatingScale.maxLevelLabel.label" default="Max Level Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="maxLevelLabel" required="" value="${numericRatingScaleInstance?.maxLevelLabel}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: numericRatingScaleInstance, field: 'maxLevelValue', 'error')} required">
	<label for="maxLevelValue">
		<g:message code="numericRatingScale.maxLevelValue.label" default="Max Level Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxLevelValue" type="number" value="${numericRatingScaleInstance.maxLevelValue}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: numericRatingScaleInstance, field: 'increment', 'error')} required">
	<label for="increment">
		<g:message code="numericRatingScale.increment.label" default="Increment" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="increment" value="${fieldValue(bean: numericRatingScaleInstance, field: 'increment')}" required=""/>

</div>

