

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show LeagueStat</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LeagueStat List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New LeagueStat</g:link></span>
        </div>
        <div class="body">
            <h1>Show LeagueStat</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:leagueStat, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">League:</td>
                            
                            <td valign="top" class="value"><g:link controller="league" action="show" id="${leagueStat?.league?.id}">${leagueStat?.league?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Rating Update:</td>
                            
                            <td valign="top" class="value"><g:link controller="ratingUpdate" action="show" id="${leagueStat?.ratingUpdate?.id}">${leagueStat?.ratingUpdate?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Rating Status:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:leagueStat, field:'ratingStatus')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Credit Status:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:leagueStat, field:'creditStatus')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Position:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:leagueStat, field:'position')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${leagueStat?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
