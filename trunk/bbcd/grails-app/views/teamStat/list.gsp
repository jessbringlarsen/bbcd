

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TeamStat List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New TeamStat</g:link></span>
        </div>
        <div class="body">
            <h1>TeamStat List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <g:render template="/teamStat/teamStatList" />

            <div class="paginateButtons">
                <g:paginate total="${TeamStat.count()}" />
            </div>
        </div>
    </body>
</html>
