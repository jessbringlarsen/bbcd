

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit PlayerStatTournament</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">PlayerStatTournament List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New PlayerStatTournament</g:link></span>
        </div>
        <div class="body">
            <h1>Edit PlayerStatTournament</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${playerStatTournament}">
            <div class="errors">
                <g:renderErrors bean="${playerStatTournament}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${playerStatTournament?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tournament">Tournament:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:playerStatTournament,field:'tournament','errors')}">
                                    <g:select optionKey="id" from="${Tournament.list()}" name="tournament.id" value="${playerStatTournament?.tournament?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="player">Player:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:playerStatTournament,field:'player','errors')}">
                                    <g:select optionKey="id" from="${Player.list()}" name="player.id" value="${playerStatTournament?.player?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="noOfTimesBought">No Of Times Bought:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:playerStatTournament,field:'noOfTimesBought','errors')}">
                                    <input type="text" id="noOfTimesBought" name="noOfTimesBought" value="${fieldValue(bean:playerStatTournament,field:'noOfTimesBought')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="noOfTimesSold">No Of Times Sold:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:playerStatTournament,field:'noOfTimesSold','errors')}">
                                    <input type="text" id="noOfTimesSold" name="noOfTimesSold" value="${fieldValue(bean:playerStatTournament,field:'noOfTimesSold')}" />
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
