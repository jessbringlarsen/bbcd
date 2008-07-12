

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Player List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Player</g:link></span>
        </div>
        <div class="body">
            <h1>Player List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="dateOfBirth" title="Date Of Birth" />
                        
                   	        <g:sortableColumn property="gender" title="Gender" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="playerNo" title="Player No" />
                        
                   	        <g:sortableColumn property="xmlId" title="Xml Id" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${playerList}" status="i" var="player">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${player.id}">${player.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${player.dateOfBirth?.encodeAsHTML()}</td>
                        
                            <td>${player.gender?.encodeAsHTML()}</td>
                        
                            <td>${player.name?.encodeAsHTML()}</td>
                        
                            <td>${player.playerNo?.encodeAsHTML()}</td>
                        
                            <td>${player.xmlId?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Player.count()}" />
            </div>
        </div>
    </body>
</html>
