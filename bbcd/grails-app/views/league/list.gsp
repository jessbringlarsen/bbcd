

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>League List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New League</g:link></span>
        </div>
        <div class="body">
            <h1>League List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="creationDate" title="Creation Date" />
                        
                   	        <th>League Administrator</th>
                   	    
                   	        <g:sortableColumn property="password" title="Password" />
                        
                   	        <th>Tournament</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${leagueList}" status="i" var="league">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${league.id}">${fieldValue(bean:league, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:league, field:'name')}</td>
                        
                            <td>${fieldValue(bean:league, field:'creationDate')}</td>
                        
                            <td>${fieldValue(bean:league, field:'leagueAdministrator')}</td>
                        
                            <td>${fieldValue(bean:league, field:'password')}</td>
                        
                            <td>${fieldValue(bean:league, field:'tournament')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${League.count()}" />
            </div>
        </div>
    </body>
</html>
