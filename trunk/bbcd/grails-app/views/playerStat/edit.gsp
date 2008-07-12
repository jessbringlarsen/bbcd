

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit PlayerStat</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">PlayerStat List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New PlayerStat</g:link></span>
        </div>
        <div class="body">
            <h1>Edit PlayerStat</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${playerStat}">
            <div class="errors">
                <g:renderErrors bean="${playerStat}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${playerStat?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="creditStatus">Credit Status:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:playerStat,field:'creditStatus','errors')}">
                                    <input type="text" id="creditStatus" name="creditStatus" value="${fieldValue(bean:playerStat,field:'creditStatus')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="player">Player:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:playerStat,field:'player','errors')}">
                                    <g:select optionKey="id" from="${Player.list()}" name="player.id" value="${playerStat?.player?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ratingStatus">Rating Status:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:playerStat,field:'ratingStatus','errors')}">
                                    <input type="text" id="ratingStatus" name="ratingStatus" value="${fieldValue(bean:playerStat,field:'ratingStatus')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ratingUpdate">Rating Update:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:playerStat,field:'ratingUpdate','errors')}">
                                    <g:select optionKey="id" from="${RatingUpdate.list()}" name="ratingUpdate.id" value="${playerStat?.ratingUpdate?.id}" ></g:select>
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
