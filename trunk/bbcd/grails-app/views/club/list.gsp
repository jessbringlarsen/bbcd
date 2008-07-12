

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Club List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Club</g:link></span>
        </div>
        <div class="body">
            <h1>Club List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="shortName" title="Short Name" />
                        
                   	        <th>Union</th>
                   	    
                   	        <g:sortableColumn property="xmlId" title="Xml Id" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clubList}" status="i" var="club">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${club.id}">${club.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${club.name?.encodeAsHTML()}</td>
                        
                            <td>${club.shortName?.encodeAsHTML()}</td>
                        
                            <td>${club.union?.encodeAsHTML()}</td>
                        
                            <td>${club.xmlId?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Club.count()}" />
            </div>
        </div>
    </body>
</html>
