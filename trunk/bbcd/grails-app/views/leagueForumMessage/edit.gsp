

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit LeagueForumMessage</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LeagueForumMessage List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New LeagueForumMessage</g:link></span>
        </div>
        <div class="body">
            <h1>Edit LeagueForumMessage</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${leagueForumMessage}">
            <div class="errors">
                <g:renderErrors bean="${leagueForumMessage}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${leagueForumMessage?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="author">Author:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leagueForumMessage,field:'author','errors')}">
                                    <g:select optionKey="id" from="${Profile.list()}" name="author.id" value="${leagueForumMessage?.author?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="created">Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leagueForumMessage,field:'created','errors')}">
                                    <g:datePicker name="created" value="${leagueForumMessage?.created}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="league">League:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leagueForumMessage,field:'league','errors')}">
                                    <g:select optionKey="id" from="${League.list()}" name="league.id" value="${leagueForumMessage?.league?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="message">Message:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leagueForumMessage,field:'message','errors')}">
                                    <input type="text" id="message" name="message" value="${fieldValue(bean:leagueForumMessage,field:'message')}"/>
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
