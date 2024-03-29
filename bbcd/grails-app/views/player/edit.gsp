

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Player</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Player List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Player</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Player</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${player}">
            <div class="errors">
                <g:renderErrors bean="${player}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${player?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="xmlId">Xml Id:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:player,field:'xmlId','errors')}">
                                    <input type="text" id="xmlId" name="xmlId" value="${fieldValue(bean:player,field:'xmlId')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="playerNo">Player No:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:player,field:'playerNo','errors')}">
                                    <input type="text" id="playerNo" name="playerNo" value="${fieldValue(bean:player,field:'playerNo')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:player,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:player,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gender">Gender:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:player,field:'gender','errors')}">
                                    <input type="text" id="gender" name="gender" value="${fieldValue(bean:player,field:'gender')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateOfBirth">Date Of Birth:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:player,field:'dateOfBirth','errors')}">
                                    <g:datePicker name="dateOfBirth" value="${player?.dateOfBirth}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ratings">Ratings:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:player,field:'ratings','errors')}">
                                    
<ul>
<g:each var="r" in="${player?.ratings?}">
    <li><g:link controller="rating" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="rating" params="['player.id':player?.id]" action="create">Add Rating</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="teams">Teams:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:player,field:'teams','errors')}">
                                    
<ul>
<g:each var="t" in="${player?.teams?}">
    <li><g:link controller="team" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="team" params="['player.id':player?.id]" action="create">Add Team</g:link>

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
