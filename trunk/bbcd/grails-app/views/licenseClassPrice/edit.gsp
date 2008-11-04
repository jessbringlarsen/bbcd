

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit LicenseClassPrice</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LicenseClassPrice List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New LicenseClassPrice</g:link></span>
        </div>
        <div class="body">
            <h1>Edit LicenseClassPrice</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${licenseClassPrice}">
            <div class="errors">
                <g:renderErrors bean="${licenseClassPrice}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${licenseClassPrice?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="licenseClass">License Class:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:licenseClassPrice,field:'licenseClass','errors')}">
                                    
<ul>
<g:each var="l" in="${licenseClassPrice?.licenseClass?}">
    <li><g:link controller="licenseClass" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="licenseClass" params="['licenseClassPrice.id':licenseClassPrice?.id]" action="create">Add LicenseClass</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price">Price:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:licenseClassPrice,field:'price','errors')}">
                                    <input type="text" id="price" name="price" value="${fieldValue(bean:licenseClassPrice,field:'price')}" />
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
