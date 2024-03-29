

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Team List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Team</g:link></span>
        </div>
        <div class="body">
            <h1>Team List</h1>
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
                        
                   	        <th>Team Owner</th>
                   	    
                   	        <g:sortableColumn property="credit" title="Credit" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${teamList}" status="i" var="team">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${team.id}">${fieldValue(bean:team, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:team, field:'name')}</td>
                        
                            <td>${fieldValue(bean:team, field:'creationDate')}</td>
                        
                            <td>${fieldValue(bean:team, field:'teamOwner')}</td>
                        
                            <td>${fieldValue(bean:team, field:'credit')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Team.count()}" />
            </div>
        </div>
    </body>
</html>
