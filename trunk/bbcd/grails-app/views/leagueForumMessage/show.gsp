

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show LeagueForumMessage</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LeagueForumMessage List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New LeagueForumMessage</g:link></span>
        </div>
        <div class="body">
            <h1>Show LeagueForumMessage</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:leagueForumMessage, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Author:</td>
                            
                            <td valign="top" class="value"><g:link controller="profile" action="show" id="${leagueForumMessage?.author?.id}">${leagueForumMessage?.author?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:leagueForumMessage, field:'created')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">League:</td>
                            
                            <td valign="top" class="value"><g:link controller="league" action="show" id="${leagueForumMessage?.league?.id}">${leagueForumMessage?.league?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Message:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:leagueForumMessage, field:'message')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${leagueForumMessage?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
