

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
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Team</th>
                   	    
                   	        <th>Rating Update</th>
                   	    
                   	        <g:sortableColumn property="ratingStatus" title="Rating Status" />
                        
                   	        <g:sortableColumn property="creditStatus" title="Credit Status" />
                        
                   	        <g:sortableColumn property="position" title="Position" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${teamStatList}" status="i" var="teamStat">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${teamStat.id}">${fieldValue(bean:teamStat, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:teamStat, field:'team')}</td>
                        
                            <td>${fieldValue(bean:teamStat, field:'ratingUpdate')}</td>
                        
                            <td>${fieldValue(bean:teamStat, field:'ratingStatus')}</td>
                        
                            <td>${fieldValue(bean:teamStat, field:'creditStatus')}</td>
                        
                            <td>${fieldValue(bean:teamStat, field:'position')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${TeamStat.count()}" />
            </div>
        </div>
    </body>
</html>
