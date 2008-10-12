

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Profile</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Profile List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Profile</g:link></span>
        </div>
        <div class="body">
            <h1>Show Profile</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:profile, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Username:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:profile, field:'username')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">User Real Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:profile, field:'userRealName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Passwd:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:profile, field:'passwd')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Enabled:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:profile, field:'enabled')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Authorities:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:profile, field:'authorities')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:profile, field:'description')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Email:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:profile, field:'email')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Email Show:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:profile, field:'emailShow')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Pass:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:profile, field:'pass')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${profile?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
