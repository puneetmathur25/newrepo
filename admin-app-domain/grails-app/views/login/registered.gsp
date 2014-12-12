<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="user.registered.title" args="[meta(name: 'app.name')]" /></title>
    <meta name="layout" content="login"/>
</head>

<body>
<div class="row">
    <div class="col-lg-12">
    <h1>
        <g:message code='default.welcome.title' 
            args="[meta(name: 'app.name')]" />
    </h1>
    <p>
        You have successfully registered, a confirmation email has been sent to <b>${cmd.email}</b>, please follow the instruction to activate your account.
    </p>
    </div>
</div>
</body>
</html>
