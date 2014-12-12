<%@ page import="edu.osumc.bmi.ird.ready.User" %>

<g:set var="profileImg" value="../images/default_profile.jpeg"/>


<div class="form-group">
    <label for="username" class="col-sm-2 control-label">
        <g:message code="user.username.label" default="Username"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-8">
        <input class="form-control" name="username" id="username" placeholder="Username"
               value="${cmd?.username}">
    </div>
</div>

<div class="form-group">
    <label for="password" class="col-sm-2 control-label">
        <g:message code="user.password.label" default="Password"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-8">
        <input type="password" class="form-control" name="password" id="password" placeholder="Password">
    </div>
</div>

<div class="form-group">
    <label for="confirmedPassword" class="col-sm-2 control-label">
        <g:message code="user.password.confirm.label" default="Confirm Password"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-8">
        <input type="password" class="form-control" name="confirmedPassword" id="confirmedPassword"
               placeholder="Confirm Password">
    </div>
</div>

<div class="form-group">
    <label for="email" class="col-sm-2 control-label">
        <g:message code="user.email.label" default="Email"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-8">
        <input class="form-control" name="email" id="email" placeholder="Email" value="${cmd?.email}"/>
    </div>
</div>

<div class="form-group">
    <label for="firstName" class="col-sm-2 control-label">
        <g:message code="user.firstName.label" default="First Name"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-8">
        <input id="firstName" name="firstName" class="form-control" placeholder="First Name"
               value="${cmd?.firstName}"/>
    </div>
</div>

<div class="form-group">
    <label for="lastName" class="col-sm-2 control-label">
        <g:message code="user.lastName.label" default="Last Name"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-8">
        <input id='lastName' name="lastName" class="form-control" placeholder="Last Name"
               value="${cmd?.lastName}"/>
    </div>
</div>

<div class="form-group">
    <label for="institution" class="col-sm-2 control-label">
        <g:message code="user.institution.label" default="Institution"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-8">
       <g:select id="institution"
       			name="institution.id" 
       			from="${edu.osumc.bmi.cielho.Institution.list()}" 
       			optionKey="id" optionValue="fullName" 
       			required=""  
       			value="${cmd?.institution}" 
       			noSelection="['':'Select Institution']" class="form-control"/>
    </div>
</div>

<div class="form-group">
    <label for="profile" class="col-sm-2 control-label">
        <g:message code="user.profile.label"/>
    </label>

    <div class="col-sm-8">
        <textarea id='profile' name="profile" class="form-control" rows="4">${cmd?.profile}</textarea>
    </div>
</div>

<div class="form-group">
    <label for="profilePic" class="col-sm-2 control-label">
        <g:message code="user.profilePic.label" default="Profile Picture"/>
    </label>
    <div id="avatar" class="col-sm-1">
		<img src="${profileImg}" alt="" class="img-rounded img-responsive img-thumbnail" />
	</div>
    <div class="col-sm-7">
        <input type="file" class="form-control" name="profilePic" id="profilePic" value="${cmd?.profilePic}"/>
    </div>
</div>

<div class="form-group">
    <label for="annotations" class="col-sm-2 control-label">
        <g:message code="project.annotations.label"/>
    </label>

    <div class="col-sm-8 ui-widget">
        <g:field type="search" id="annotations" name="annotations" class="form-control" placeholder="Interests"/>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-10 col-sm-offset-2" for="agreement">
        <input type="checkbox" value="${true}" name="agreement" id="agreement">
        ${message(code: 'register.agreement.label')}</label>
    <div class='col-sm-10 col-sm-offset-2' id='agreementAlert'>
    </div>
</div>


