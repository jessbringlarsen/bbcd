

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>LeagueParticipant List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New LeagueParticipant</g:link></span>
        </div>
        <div class="body">
            <h1>LeagueParticipant List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>League</th>
                   	    
                   	        <th>Team</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${leagueParticipantList}" status="i" var="leagueParticipant">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${leagueParticipant.id}">${fieldValue(bean:leagueParticipant, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:leagueParticipant, field:'league')}</td>
                        
                            <td>${fieldValue(bean:leagueParticipant, field:'team')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${LeagueParticipant.count()}" />
            </div>
        </div>
    </body>
</html>
