

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit LicenseClassAge</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LicenseClassAge List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New LicenseClassAge</g:link></span>
        </div>
        <div class="body">
            <h1>Edit LicenseClassAge</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${licenseClassAge}">
            <div class="errors">
                <g:renderErrors bean="${licenseClassAge}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${licenseClassAge?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ageFrom">Age From:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:licenseClassAge,field:'ageFrom','errors')}">
                                    <input type="text" id="ageFrom" name="ageFrom" value="${fieldValue(bean:licenseClassAge,field:'ageFrom')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ageTo">Age To:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:licenseClassAge,field:'ageTo','errors')}">
                                    <input type="text" id="ageTo" name="ageTo" value="${fieldValue(bean:licenseClassAge,field:'ageTo')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="licenseClass">License Class:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:licenseClassAge,field:'licenseClass','errors')}">
                                    
<ul>
<g:each var="l" in="${licenseClassAge?.licenseClass?}">
    <li><g:link controller="licenseClass" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="licenseClass" params="['licenseClassAge.id':licenseClassAge?.id]" action="create">Add LicenseClass</g:link>

                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
