

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>PlayerExternalBinding List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New PlayerExternalBinding</g:link></span>
        </div>
        <div class="body">
            <h1>PlayerExternalBinding List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Player</th>
                   	    
                   	        <g:sortableColumn property="externalId" title="External Id" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${playerExternalBindingList}" status="i" var="playerExternalBinding">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${playerExternalBinding.id}">${playerExternalBinding.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${playerExternalBinding.player?.encodeAsHTML()}</td>
                        
                            <td>${playerExternalBinding.externalId?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${PlayerExternalBinding.count()}" />
            </div>
        </div>
    </body>
</html>
