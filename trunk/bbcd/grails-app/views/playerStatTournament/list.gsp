

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>PlayerStatTournament List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New PlayerStatTournament</g:link></span>
        </div>
        <div class="body">
            <h1>PlayerStatTournament List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Tournament</th>
                   	    
                   	        <th>Player</th>
                   	    
                   	        <g:sortableColumn property="noOfTimesBought" title="No Of Times Bought" />
                        
                   	        <g:sortableColumn property="noOfTimesSold" title="No Of Times Sold" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${playerStatTournamentList}" status="i" var="playerStatTournament">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${playerStatTournament.id}">${fieldValue(bean:playerStatTournament, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:playerStatTournament, field:'tournament')}</td>
                        
                            <td>${fieldValue(bean:playerStatTournament, field:'player')}</td>
                        
                            <td>${fieldValue(bean:playerStatTournament, field:'noOfTimesBought')}</td>
                        
                            <td>${fieldValue(bean:playerStatTournament, field:'noOfTimesSold')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${PlayerStatTournament.count()}" />
            </div>
        </div>
    </body>
</html>
