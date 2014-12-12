<html>
<head>
    <title><g:message code="user.email.title"
                      args="[meta(name: 'app.name')]"/></title>
    <meta name="layout" content="main"/>
</head>

<body>
<div id="user-changePassword">
    <g:if test="${flash.message}">
        <div class="alert alert-info alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            ${flash.message}
        </div>
    </g:if>
    <g:hasErrors bean="${cmd}">
        <ul class="errors" role="alert">
            <g:eachError bean="${cmd}" var="error">
                <li <g:if
                            test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form controller='login' class="form-horizontal top20">
    <div class="form-group">
        <label for="password" class="col-sm-2 control-label">
            <g:message code="user.password.label"/>
            <span>*</span>
        </label>

        <div class="col-sm-8">
            <input type="password" id='password' name="password" class="form-control" placeholder="Password"/>
        </div>
    </div>
    <div class="form-group">
        <label for="email" class="col-sm-2 control-label">
            <g:message code="user.email.label"/>
            <span>*</span>
        </label>

        <div class="col-sm-8">
            <input id='email' name="email" class="form-control" placeholder="Email"/>
        </div>
    </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-2">
                <g:actionSubmit action="updateEmail" value="${message(code: 'button.update.label', default: 'Update')}"
                                                class="btn btn-primary">
                                </g:actionSubmit>
            </div>

            <div class="col-sm-2">
                <g:actionSubmit action="index" value="${message(code: 'button.cancel.label', default: 'Cancel')}"
                                class="btn btn-primary">
                </g:actionSubmit>
            </div>
        </div>
    </g:form>
</div>
</body>
</html>
