

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Tournament</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Tournament List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Tournament</g:link></span>
        </div>
        <div class="body">
            <h1>Show Tournament</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tournament, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tournament, field:'name')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Tournament Start:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tournament, field:'tournamentStart')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Tournament End:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tournament, field:'tournamentEnd')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Is Current Tournament:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tournament, field:'isCurrentTournament')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${tournament?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
