

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create PlayerExternalBinding</title>
        <g:javascript library="prototype"/>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">PlayerExternalBinding List</g:link></span>
        </div>
        <div class="body">

            <h1>Create PlayerExternalBinding</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${playerExternalBinding}">
            <div class="errors">
                <g:renderErrors bean="${playerExternalBinding}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>

							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="club">Klub:</label>
                                </td>
                                <td valign="top">
                                    <g:select
                                    	optionKey="id"
	                                    from="${clubList}"
	                                    name="club.id"
	                                    noSelection="${defaultClub}"
	                                    	onchange="${remoteFunction(
	                                    		action:'updatePlayers',
	                                    		update:'playerListDiv',
	                                    		params:'\'clubId=\' + this.value')}">
                                    </g:select>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="player">Spiller:</label>
                                </td>
                                <td valign="top" class="value">
		                            <div id="playerListDiv">
		                             <g:select
                                        optionKey="id"
                                        from="${playerList}"
                                        name="player.id">
                                    </g:select>
		                            </div>
		                        </td>
                            </tr>

                            <tr class="prop">
                                <td colspan="2" valign="top" class="value ${hasErrors(bean:playerExternalBinding,field:'externalId','errors')}">
                                    <input type="hidden" id="externalId" name="externalId" value="${fieldValue(bean:playerExternalBinding,field:'externalId')}"/>
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