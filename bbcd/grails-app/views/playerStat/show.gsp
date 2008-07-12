

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show PlayerStat</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">PlayerStat List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New PlayerStat</g:link></span>
        </div>
        <div class="body">
            <h1>Show PlayerStat</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${playerStat.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Credit Status:</td>
                            
                            <td valign="top" class="value">${playerStat.creditStatus}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Player:</td>
                            
                            <td valign="top" class="value"><g:link controller="player" action="show" id="${playerStat?.player?.id}">${playerStat?.player}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Rating Status:</td>
                            
                            <td valign="top" class="value">${playerStat.ratingStatus}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Rating Update:</td>
                            
                            <td valign="top" class="value"><g:link controller="ratingUpdate" action="show" id="${playerStat?.ratingUpdate?.id}">${playerStat?.ratingUpdate}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${playerStat?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
