

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Rating List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Rating</g:link></span>
        </div>
        <div class="body">
            <h1>Rating List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Club</th>
                   	    
                   	        <th>Player</th>
                   	    
                   	        <g:sortableColumn property="rating" title="Rating" />
                        
                   	        <th>Rating Update</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ratingList}" status="i" var="rating">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${rating.id}">${rating.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${rating.club?.encodeAsHTML()}</td>
                        
                            <td>${rating.player?.encodeAsHTML()}</td>
                        
                            <td>${rating.rating?.encodeAsHTML()}</td>
                        
                            <td>${rating.ratingUpdate?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Rating.count()}" />
            </div>
        </div>
    </body>
</html>
