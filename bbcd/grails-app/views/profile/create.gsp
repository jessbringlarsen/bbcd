

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Profile</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Profile List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Profile</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${profile}">
            <div class="errors">
                <g:renderErrors bean="${profile}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName">First Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'firstName','errors')}">
                                    <input type="text" id="firstName" name="firstName" value="${fieldValue(bean:profile,field:'firstName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sirName">Sir Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'sirName','errors')}">
                                    <input type="text" id="sirName" name="sirName" value="${fieldValue(bean:profile,field:'sirName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:profile,field:'email')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'password','errors')}">
                                    <input type="password" id="password" name="password" value="${fieldValue(bean:profile,field:'password')}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="activated">Activated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'activated','errors')}">
                                    <input type="text" id="activated" name="activated" value="${fieldValue(bean:profile,field:'activated')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastLogin">Last Login:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'lastLogin','errors')}">
                                    <g:datePicker name="lastLogin" value="${profile?.lastLogin}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
