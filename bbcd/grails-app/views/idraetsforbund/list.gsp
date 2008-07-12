

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Idraetsforbund List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Idraetsforbund</g:link></span>
        </div>
        <div class="body">
            <h1>Idraetsforbund List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="xmlId" title="Xml Id" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${idraetsforbundList}" status="i" var="idraetsforbund">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${idraetsforbund.id}">${idraetsforbund.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${idraetsforbund.name?.encodeAsHTML()}</td>
                        
                            <td>${idraetsforbund.xmlId?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Idraetsforbund.count()}" />
            </div>
        </div>
    </body>
</html>
