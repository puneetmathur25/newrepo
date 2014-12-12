<html>
<head>
    <title><g:message code="user.register.title" args="[meta(name: 'app.name')]"/></title>
    <meta name="layout" content="login"/>
    <r:require modules = "login" />
</head>

<body>
<div id="register-user">
    <g:if test="${flash.message}">
        <div class="alert alert-info alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            ${flash.message}
        </div>
    </g:if>
    <g:hasErrors bean="${cmd}">
        <ul class="errors" role="alert">
            <g:eachError bean="${cmd}" var="error">
            <div class="alert alert-info alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <g:if test="${error in org.springframework.validation.FieldError}"><g:message error="${error}"/></g:if>
            </div>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:uploadForm controller='login' action='register' 
        name='registerForm' class="form-horizontal top20" role="form">
        <g:render template="form"/>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-2">
                <button type="submit" class="btn btn-primary" id='register'>
                    <g:message code="${message(code: 'register.button.label')}"/>
                </button>
            </div>

            <div class="col-sm-2">
                <button type="reset" value="Reset" class="btn btn-primary"><g:message code="${message(code:
                        'button.reset.label',
                        default: 'Reset')}"/></button>
            </div>
        </div>
    </g:uploadForm>
</div>
<script type="text/javascript">
    var annotationLink = "${createLink(controller: 'annotation', action: 'search')}"
</script>
</body>
</html>
