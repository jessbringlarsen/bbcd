

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit TeamPlayer</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">TeamPlayer List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New TeamPlayer</g:link></span>
        </div>
        <div class="body">
            <h1>Edit TeamPlayer</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${teamPlayer}">
            <div class="errors">
                <g:renderErrors bean="${teamPlayer}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${teamPlayer?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="player">Player:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:teamPlayer,field:'player','errors')}">
                                    <g:select optionKey="id" from="${Player.list()}" name="player.id" value="${teamPlayer?.player?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="team">Team:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:teamPlayer,field:'team','errors')}">
                                    <g:select optionKey="id" from="${Team.list()}" name="team.id" value="${teamPlayer?.team?.id}" ></g:select>
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
