

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>LicenseClassAge List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New LicenseClassAge</g:link></span>
        </div>
        <div class="body">
            <h1>LicenseClassAge List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="ageFrom" title="Age From" />
                        
                   	        <g:sortableColumn property="ageTo" title="Age To" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${licenseClassAgeList}" status="i" var="licenseClassAge">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${licenseClassAge.id}">${fieldValue(bean:licenseClassAge, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:licenseClassAge, field:'ageFrom')}</td>
                        
                            <td>${fieldValue(bean:licenseClassAge, field:'ageTo')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${LicenseClassAge.count()}" />
            </div>
        </div>
    </body>
</html>
