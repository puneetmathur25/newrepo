<html>
<head>
    <title><g:message code="springSecurity.login.title"/></title>
    <meta name="layout" content="main"/>
</head>
<body>
<section id="login" class="first">
	<div class="row">
        <g:if test="${flash.message}">
        <div class="alert alert-info alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            ${flash.message}
        </div>
        </g:if>
        <g:hasErrors bean="${userInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${userInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
	</div>
		
	<div class="row">
		<div class="col-md-6">
The mindless help waves. Why can't the lyric trolley revolt opposite the poet? An industrial gateway thirsts within the welcome. Every charitable choice obtains the correspondent fish.
		</div>
        <div class="col-md-1">&nbsp;</div>
		<div class="col-md-5">
	        <form role="form" id='loginForm' class='form-horizontal' action='${postUrl}'
	                method='POST' autocomplete='off'>
	            <div class="form-group">
	                <h3><g:message code="springSecurity.login.header"/></h3>
	            </div>
	
	            <div class="form-group">
	                <label for="username" class="col-sm-2 control-label">
	                    <g:message code="user.username.label" default="Username"/>
	                </label>
	
	                <div class="col-sm-8">
	                    <g:field type="input" class="form-control" name="j_username" id="username" placeholder="Username" value="${userInstance?.username}" required="true"/>
	                </div>
	            </div>
	
	            <div class="form-group">
	                <label for="password" class="col-sm-2 control-label">
	                    <g:message code="user.password.label" default="Password"/>
	                </label>
	
	                <div class="col-sm-8">
	                    <g:field type="password" class="form-control" name="j_password" id="password" placeholder="Password" required="true"/>
	                </div>
	            </div>
	
	            <div class="form-group">
	                <div class="col-sm-offset-2 col-sm-10">
	                    <div class="checkbox">
	                        <label>
	                            <g:checkBox name="${rememberMeParameter}" value="${hasCookie}"/> <g:message
	                                    code="user.rememberMe.label" default="Remember Me"/>
	                        </label>
	                    </div>
	                </div>
	            </div>
	
	            <div class="form-group">
	                <div class="col-sm-12">
	                    <input type="submit" id="submit" class="btn btn-primary col-sm-8 col-sm-offset-2"
	                           value='${message(code: "springSecurity.login.button", default: 'Login')}'/>
	                </div>
	            </div>
	            <div class="form-group">
	            <div class="col-sm-12">
	<!--                <g:link action="newAccount" class="col-sm-8 col-sm-offset-3"><g:message code="${message(code: 'new.account.button.label')}"/></g:link>
	-->
	            </div>
	            </div>
	        </form>
	    </div>
    </div>
</section>

<script type='text/javascript'>
    <!--
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>

</body>
</html>
