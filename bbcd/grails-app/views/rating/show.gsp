

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Rating</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Rating List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Rating</g:link></span>
        </div>
        <div class="body">
            <h1>Show Rating</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${rating.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Club:</td>
                            
                            <td valign="top" class="value"><g:link controller="club" action="show" id="${rating?.club?.id}">${rating?.club}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Player:</td>
                            
                            <td valign="top" class="value"><g:link controller="player" action="show" id="${rating?.player?.id}">${rating?.player}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Rating:</td>
                            
                            <td valign="top" class="value">${rating.rating}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Rating Update:</td>
                            
                            <td valign="top" class="value"><g:link controller="ratingUpdate" action="show" id="${rating?.ratingUpdate?.id}">${rating?.ratingUpdate}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${rating?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
