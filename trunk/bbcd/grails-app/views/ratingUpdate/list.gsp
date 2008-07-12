

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>RatingUpdate List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New RatingUpdate</g:link></span>
        </div>
        <div class="body">
            <h1>RatingUpdate List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="dateOfUpdate" title="Date Of Update" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ratingUpdateList}" status="i" var="ratingUpdate">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ratingUpdate.id}">${ratingUpdate.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${ratingUpdate.dateOfUpdate?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${RatingUpdate.count()}" />
            </div>
        </div>
    </body>
</html>
