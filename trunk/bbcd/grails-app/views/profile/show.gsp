

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
                            
                            <td valign="top" class="value">${profile.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Activated:</td>
                            
                            <td valign="top" class="value">${profile.activated}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Activation Key:</td>
                            
                            <td valign="top" class="value">${profile.activationKey}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Answer:</td>
                            
                            <td valign="top" class="value">${profile.answer}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Email:</td>
                            
                            <td valign="top" class="value">${profile.email}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Firstname:</td>
                            
                            <td valign="top" class="value">${profile.firstName}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Login:</td>
                            
                            <td valign="top" class="value">${profile.lastLogin}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Password:</td>
                            
                            <td valign="top" class="value">${profile.password}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Question:</td>
                            
                            <td valign="top" class="value">${profile.question}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Sirname:</td>
                            
                            <td valign="top" class="value">${profile.sirName}</td>
                            
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
