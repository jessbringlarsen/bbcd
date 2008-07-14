

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show TeamStat</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">TeamStat List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New TeamStat</g:link></span>
        </div>
        <div class="body">
            <h1>Show TeamStat</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:teamStat, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Team:</td>
                            
                            <td valign="top" class="value"><g:link controller="team" action="show" id="${teamStat?.team?.id}">${teamStat?.team?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Rating Update:</td>
                            
                            <td valign="top" class="value"><g:link controller="ratingUpdate" action="show" id="${teamStat?.ratingUpdate?.id}">${teamStat?.ratingUpdate?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Rating Status:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:teamStat, field:'ratingStatus')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Credit Status:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:teamStat, field:'creditStatus')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Position:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:teamStat, field:'position')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${teamStat?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
