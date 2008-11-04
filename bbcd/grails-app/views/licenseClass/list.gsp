

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>LicenseClass List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New LicenseClass</g:link></span>
        </div>
        <div class="body">
            <h1>LicenseClass List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="className" title="Class Name" />
                        
                   	        <g:sortableColumn property="gender" title="Gender" />
                        
                   	        <g:sortableColumn property="minRating" title="Min Rating" />
                        
                   	        <g:sortableColumn property="maxRating" title="Max Rating" />
                        
                   	        <th>Price</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${licenseClassList}" status="i" var="licenseClass">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${licenseClass.id}">${fieldValue(bean:licenseClass, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:licenseClass, field:'className')}</td>
                        
                            <td>${fieldValue(bean:licenseClass, field:'gender')}</td>
                        
                            <td>${fieldValue(bean:licenseClass, field:'minRating')}</td>
                        
                            <td>${fieldValue(bean:licenseClass, field:'maxRating')}</td>
                        
                            <td>${fieldValue(bean:licenseClass, field:'price')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${LicenseClass.count()}" />
            </div>
        </div>
    </body>
</html>
