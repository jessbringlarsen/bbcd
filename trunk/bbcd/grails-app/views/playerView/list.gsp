

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>PlayerView List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New PlayerView</g:link></span>
        </div>
        <div class="body">
            <h1>PlayerView List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="name" title="Navn" />

                            <g:sortableColumn property="clubName" title="Klub" />

                            <g:sortableColumn property="className" title="Klasse" />

                            <g:sortableColumn property="rating" title="Rating" />
                        
                   	        <g:sortableColumn property="price" title="Pris" />

                            <th></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${playerViewList}" status="i" var="playerView">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean:playerView, field:'name')}</td>

                            <td>${fieldValue(bean:playerView, field:'clubName')}</td>

                            <td>${fieldValue(bean:playerView, field:'className')}</td>

                            <td>${fieldValue(bean:playerView, field:'rating')}</td>
                        
                            <td>${fieldValue(bean:playerView, field:'price')}</td>

                            <td><g:link action="show" id="${playerView.id}">Køb</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${PlayerView.count()}" />
            </div>
        </div>
    </body>
</html>
