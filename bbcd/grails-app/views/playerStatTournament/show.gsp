

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show PlayerStatTournament</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">PlayerStatTournament List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New PlayerStatTournament</g:link></span>
        </div>
        <div class="body">
            <h1>Show PlayerStatTournament</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:playerStatTournament, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Tournament:</td>
                            
                            <td valign="top" class="value"><g:link controller="tournament" action="show" id="${playerStatTournament?.tournament?.id}">${playerStatTournament?.tournament?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Player:</td>
                            
                            <td valign="top" class="value"><g:link controller="player" action="show" id="${playerStatTournament?.player?.id}">${playerStatTournament?.player?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">No Of Times Bought:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:playerStatTournament, field:'noOfTimesBought')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">No Of Times Sold:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:playerStatTournament, field:'noOfTimesSold')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${playerStatTournament?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
