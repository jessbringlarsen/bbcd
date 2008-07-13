

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Team</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Team List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Team</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${team}">
            <div class="errors">
                <g:renderErrors bean="${team}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:team,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:team,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="creationDate">Creation Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:team,field:'creationDate','errors')}">
                                    <g:datePicker name="creationDate" value="${team?.creationDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="credit">Credit:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:team,field:'credit','errors')}">
                                    <input type="text" id="credit" name="credit" value="${fieldValue(bean:team,field:'credit')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="teamOwner">Team Owner:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:team,field:'teamOwner','errors')}">
                                    <g:select optionKey="id" from="${Profile.list()}" name="teamOwner.id" value="${team?.teamOwner?.id}" ></g:select>
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
