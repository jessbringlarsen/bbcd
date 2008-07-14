

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Team</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Team List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Team</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Team</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${team}">
            <div class="errors">
                <g:renderErrors bean="${team}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${team?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:team,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:team,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="creationDate">Creation Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:team,field:'creationDate','errors')}">
                                    <g:datePicker name="creationDate" value="${team?.creationDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="teamOwner">Team Owner:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:team,field:'teamOwner','errors')}">
                                    <g:select optionKey="id" from="${Profile.list()}" name="teamOwner.id" value="${team?.teamOwner?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="credit">Credit:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:team,field:'credit','errors')}">
                                    <input type="text" id="credit" name="credit" value="${fieldValue(bean:team,field:'credit')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="inleague">Inleague:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:team,field:'inleague','errors')}">
                                    
<ul>
<g:each var="i" in="${team?.inleague?}">
    <li><g:link controller="leagueParticipant" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="leagueParticipant" params="['team.id':team?.id]" action="create">Add LeagueParticipant</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="players">Players:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:team,field:'players','errors')}">
                                    
<ul>
<g:each var="p" in="${team?.players?}">
    <li><g:link controller="teamPlayer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="teamPlayer" params="['team.id':team?.id]" action="create">Add TeamPlayer</g:link>

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
