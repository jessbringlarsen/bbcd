

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>PointsRule List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New PointsRule</g:link></span>
        </div>
        <div class="body">
            <h1>PointsRule List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="credit" title="Credit" />
                        
                   	        <g:sortableColumn property="fromRating" title="From Rating" />
                        
                   	        <g:sortableColumn property="toRating" title="To Rating" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pointsRuleList}" status="i" var="pointsRule">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pointsRule.id}">${fieldValue(bean:pointsRule, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:pointsRule, field:'credit')}</td>
                        
                            <td>${fieldValue(bean:pointsRule, field:'fromRating')}</td>
                        
                            <td>${fieldValue(bean:pointsRule, field:'toRating')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${PointsRule.count()}" />
            </div>
        </div>
    </body>
</html>
