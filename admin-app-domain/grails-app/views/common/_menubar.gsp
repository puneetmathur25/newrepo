<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class='navbar-header'>
        <button class="navbar-toggle collapsed" data-target="#navbar-responsive-collapse" data-toggle="collapse" type="button">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button> <!-- end collapse buttons -->
        <a class="navbar-brand" href="${createLink(uri: '/')}">
            <asset:image src='ready.png' width='48' height='48' />
        </a>
        </div> <!-- end of navbar-header -->
        <!-- navbar -->
        <div class="collapse navbar-collapse" id="navbar-responsive-collapse">
        <g:if test="${!layout_nomainmenu}">
        <sec:ifLoggedIn>
            <ul class="nav navbar-nav">
                <li>
                    <g:link controller='site'>
                        <g:message code="site.management.label" /> 
                    </g:link>
                </li>
                <li>
                    <g:link controller='configProfile'>
                        <g:message code="configuration.management.label" /> 
                    </g:link>
                <li>
                    <g:link controller='institution'>
                        <g:message code="institution.label" /> 
                    </g:link>
                </li>
                </li>
            </ul> <!-- end navbar-nav -->
        </sec:ifLoggedIn>
        </g:if>
        <!-- account profile -->
        <sec:ifLoggedIn>
            <ul class="nav navbar-nav pull-right">
                <g:render template="/common/user"/>
            </ul>
        </sec:ifLoggedIn>
        </div> <!-- end navbar-collapse -->
    </div> <!-- end container-fluid -->
</nav> <!-- end navbar -->

