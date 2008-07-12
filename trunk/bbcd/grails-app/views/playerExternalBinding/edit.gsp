

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit PlayerExternalBinding</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">PlayerExternalBinding List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New PlayerExternalBinding</g:link></span>
        </div>
        <div class="body">
            <h1>Edit PlayerExternalBinding</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${playerExternalBinding}">
            <div class="errors">
                <g:renderErrors bean="${playerExternalBinding}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${playerExternalBinding?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="player">Player:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:playerExternalBinding,field:'player','errors')}">
                                    <g:select optionKey="id" from="${Player.list()}" name="player.id" value="${playerExternalBinding?.player?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="externalId">External Id:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:playerExternalBinding,field:'externalId','errors')}">
                                    <input type="text" id="externalId" name="externalId" value="${fieldValue(bean:playerExternalBinding,field:'externalId')}"/>
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
