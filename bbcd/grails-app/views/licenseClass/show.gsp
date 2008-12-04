

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show LicenseClass</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LicenseClass List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New LicenseClass</g:link></span>
        </div>
        <div class="body">
            <h1>Show LicenseClass</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:licenseClass, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Class Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:licenseClass, field:'className')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Gender:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:licenseClass, field:'gender')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Min Rating:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:licenseClass, field:'minRating')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Max Rating:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:licenseClass, field:'maxRating')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Price:</td>
                            
                            <td valign="top" class="value"><g:link controller="licenseClassPrice" action="show" id="${licenseClass?.price?.id}">${licenseClass?.price?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Age:</td>
                            
                            <td valign="top" class="value"><g:link controller="licenseClassAge" action="show" id="${licenseClass?.age?.id}">${licenseClass?.age?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${licenseClass?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
