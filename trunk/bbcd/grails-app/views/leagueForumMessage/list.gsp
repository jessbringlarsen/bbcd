

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>LeagueForumMessage List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New LeagueForumMessage</g:link></span>
        </div>
        <div class="body">
            <h1>LeagueForumMessage List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Author</th>
                   	    
                   	        <g:sortableColumn property="created" title="Created" />
                        
                   	        <th>League</th>
                   	    
                   	        <g:sortableColumn property="message" title="Message" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${leagueForumMessageList}" status="i" var="leagueForumMessage">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${leagueForumMessage.id}">${fieldValue(bean:leagueForumMessage, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:leagueForumMessage, field:'author')}</td>
                        
                            <td>${fieldValue(bean:leagueForumMessage, field:'created')}</td>
                        
                            <td>${fieldValue(bean:leagueForumMessage, field:'league')}</td>
                        
                            <td>${fieldValue(bean:leagueForumMessage, field:'message')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${LeagueForumMessage.count()}" />
            </div>
        </div>
    </body>
</html>
