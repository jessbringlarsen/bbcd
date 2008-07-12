

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
                        
                            <td><g:link action="show" id="${playerStat.id}">${playerStat.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${playerStat.creditStatus?.encodeAsHTML()}</td>
                        
                            <td>${playerStat.player?.encodeAsHTML()}</td>
                        
                            <td>${playerStat.ratingStatus?.encodeAsHTML()}</td>
                        
                            <td>${playerStat.ratingUpdate?.encodeAsHTML()}</td>
                        
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
