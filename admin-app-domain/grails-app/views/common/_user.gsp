<sec:ifLoggedIn>
    <li class="dropdown">
        <a class="dropdown-toggle" role="button" data-toggle="dropdown"
           data-target="#" href="#">
            <!-- TODO: Only show menu items based on permissions (e.g., Guest has no account page) -->
            <i class="glyphicon glyphicon-user icon-white"></i>
            <sec:loggedInUserInfo field="username"/>
                <b class="caret"></b>
        </a>
        <ul class="dropdown-menu" role="menu">
            <li class=""><g:link controller="logout">
                <i class="glyphicon glyphicon-off"></i>
                <g:message code="security.signoff.label" default="Sign Out"/>
            </g:link>
            </li>
        </ul>
        <%----%>
    </li>
</sec:ifLoggedIn>
