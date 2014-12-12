<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="user.activated.title" args="[meta(name: 'app.name')]" /></title>
    <meta name="layout" content="login"/>
</head>

<body>
<section id="intro" class="first">
    <h1>
        <g:message code='default.welcome.title' 
            args="[meta(name: 'app.name')]" />
    </h1>
    <p>
        You have successfully activated your account <b>${user.username}</b>, please <g:link controller="login">
        <g:message code="user.signin.label" default="Sign In"/></g:link> now.
    </p>
</section>
</body>
</html>
