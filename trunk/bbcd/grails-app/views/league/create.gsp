

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create League</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">League List</g:link></span>
        </div>
        <div class="body">
            <h1>Create League</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${league}">
            <div class="errors">
                <g:renderErrors bean="${league}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:league,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:league,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="creationDate">Creation Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:league,field:'creationDate','errors')}">
                                    <g:datePicker name="creationDate" value="${league?.creationDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="leagueAdministrator">League Administrator:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:league,field:'leagueAdministrator','errors')}">
                                    <g:select optionKey="id" from="${Profile.list()}" name="leagueAdministrator.id" value="${league?.leagueAdministrator?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:league,field:'password','errors')}">
                                    <input type="password" id="password" name="password" value="${fieldValue(bean:league,field:'password')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tournament">Tournament:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:league,field:'tournament','errors')}">
                                    <g:select optionKey="id" from="${Tournament.list()}" name="tournament.id" value="${league?.tournament?.id}" ></g:select>
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
