

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit LicenseClass</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LicenseClass List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New LicenseClass</g:link></span>
        </div>
        <div class="body">
            <h1>Edit LicenseClass</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${licenseClass}">
            <div class="errors">
                <g:renderErrors bean="${licenseClass}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${licenseClass?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="className">Class Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:licenseClass,field:'className','errors')}">
                                    <input type="text" id="className" name="className" value="${fieldValue(bean:licenseClass,field:'className')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gender">Gender:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:licenseClass,field:'gender','errors')}">
                                    <input type="text" id="gender" name="gender" value="${fieldValue(bean:licenseClass,field:'gender')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="minRating">Min Rating:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:licenseClass,field:'minRating','errors')}">
                                    <input type="text" id="minRating" name="minRating" value="${fieldValue(bean:licenseClass,field:'minRating')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maxRating">Max Rating:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:licenseClass,field:'maxRating','errors')}">
                                    <input type="text" id="maxRating" name="maxRating" value="${fieldValue(bean:licenseClass,field:'maxRating')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price">Price:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:licenseClass,field:'price','errors')}">
                                    <g:select optionKey="id" from="${LicenseClassPrice.list()}" name="price.id" value="${licenseClass?.price?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="age">Age:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:licenseClass,field:'age','errors')}">
                                    <g:select optionKey="id" from="${LicenseClassAge.list()}" name="age.id" value="${licenseClass?.age?.id}" ></g:select>
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
