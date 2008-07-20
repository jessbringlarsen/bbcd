

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>PlayerStat List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New PlayerStat</g:link></span>
        </div>
        <div class="body">
            <h1>PlayerStat List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="creditStatus" title="Credit Status" />
                        
                   	        <th>Player</th>
                   	    
                   	        <g:sortableColumn property="ratingStatus" title="Rating Status" />
                        
                   	        <th>Rating Update</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${playerStatList}" status="i" var="playerStat">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${playerStat.id}">${fieldValue(bean:playerStat, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:playerStat, field:'creditStatus')}</td>
                        
                            <td>${fieldValue(bean:playerStat, field:'player')}</td>
                        
                            <td>${fieldValue(bean:playerStat, field:'ratingStatus')}</td>
                        
                            <td>${fieldValue(bean:playerStat, field:'ratingUpdate')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${PlayerStat.count()}" />
            </div>
        </div>
    </body>
</html>
