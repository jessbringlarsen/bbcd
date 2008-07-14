

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Profile List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Profile</g:link></span>
        </div>
        <div class="body">
            <h1>Profile List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="firstName" title="First Name" />
                        
                   	        <g:sortableColumn property="sirName" title="Sir Name" />
                        
                   	        <g:sortableColumn property="email" title="Email" />
                        
                   	        <g:sortableColumn property="password" title="Password" />
                        
                   	        <g:sortableColumn property="activated" title="Activated" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${profileList}" status="i" var="profile">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${profile.id}">${fieldValue(bean:profile, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:profile, field:'firstName')}</td>
                        
                            <td>${fieldValue(bean:profile, field:'sirName')}</td>
                        
                            <td>${fieldValue(bean:profile, field:'email')}</td>
                        
                            <td>${fieldValue(bean:profile, field:'password')}</td>
                        
                            <td>${fieldValue(bean:profile, field:'activated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Profile.count()}" />
            </div>
        </div>
    </body>
</html>
