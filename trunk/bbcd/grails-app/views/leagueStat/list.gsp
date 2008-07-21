

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>LeagueStat List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New LeagueStat</g:link></span>
        </div>
        <div class="body">
            <h1>LeagueStat List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>League</th>
                   	    
                   	        <th>Rating Update</th>
                   	    
                   	        <g:sortableColumn property="ratingStatus" title="Rating Status" />
                        
                   	        <g:sortableColumn property="creditStatus" title="Credit Status" />
                        
                   	        <g:sortableColumn property="position" title="Position" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${leagueStatList}" status="i" var="leagueStat">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${leagueStat.id}">${fieldValue(bean:leagueStat, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:leagueStat, field:'league')}</td>
                        
                            <td>${fieldValue(bean:leagueStat, field:'ratingUpdate')}</td>
                        
                            <td>${fieldValue(bean:leagueStat, field:'ratingStatus')}</td>
                        
                            <td>${fieldValue(bean:leagueStat, field:'creditStatus')}</td>
                        
                            <td>${fieldValue(bean:leagueStat, field:'position')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${LeagueStat.count()}" />
            </div>
        </div>
    </body>
</html>
