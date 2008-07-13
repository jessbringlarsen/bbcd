

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Tournament List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Tournament</g:link></span>
        </div>
        <div class="body">
            <h1>Tournament List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="tournamentStart" title="Tournament Start" />
                        
                   	        <g:sortableColumn property="tournamentEnd" title="Tournament End" />
                        
                   	        <g:sortableColumn property="isCurrentTournament" title="Is Current Tournament" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tournamentList}" status="i" var="tournament">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tournament.id}">${fieldValue(bean:tournament, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:tournament, field:'name')}</td>
                        
                            <td>${fieldValue(bean:tournament, field:'tournamentStart')}</td>
                        
                            <td>${fieldValue(bean:tournament, field:'tournamentEnd')}</td>
                        
                            <td>${fieldValue(bean:tournament, field:'isCurrentTournament')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Tournament.count()}" />
            </div>
        </div>
    </body>
</html>
