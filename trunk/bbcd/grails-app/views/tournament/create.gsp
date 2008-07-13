

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Tournament</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Tournament List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Tournament</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tournament}">
            <div class="errors">
                <g:renderErrors bean="${tournament}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:tournament,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:tournament,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tournamentStart">Tournament Start:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tournament,field:'tournamentStart','errors')}">
                                    <g:datePicker name="tournamentStart" value="${tournament?.tournamentStart}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tournamentEnd">Tournament End:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tournament,field:'tournamentEnd','errors')}">
                                    <g:datePicker name="tournamentEnd" value="${tournament?.tournamentEnd}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isCurrentTournament">Is Current Tournament:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tournament,field:'isCurrentTournament','errors')}">
                                    <g:checkBox name="isCurrentTournament" value="${tournament?.isCurrentTournament}" ></g:checkBox>
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
