

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create TeamStat</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">TeamStat List</g:link></span>
        </div>
        <div class="body">
            <h1>Create TeamStat</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${teamStat}">
            <div class="errors">
                <g:renderErrors bean="${teamStat}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="team">Team:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:teamStat,field:'team','errors')}">
                                    <g:select optionKey="id" from="${Team.list()}" name="team.id" value="${teamStat?.team?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ratingUpdate">Rating Update:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:teamStat,field:'ratingUpdate','errors')}">
                                    <g:select optionKey="id" from="${RatingUpdate.list()}" name="ratingUpdate.id" value="${teamStat?.ratingUpdate?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ratingStatus">Rating Status:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:teamStat,field:'ratingStatus','errors')}">
                                    <input type="text" id="ratingStatus" name="ratingStatus" value="${fieldValue(bean:teamStat,field:'ratingStatus')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="creditStatus">Credit Status:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:teamStat,field:'creditStatus','errors')}">
                                    <input type="text" id="creditStatus" name="creditStatus" value="${fieldValue(bean:teamStat,field:'creditStatus')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="position">Position:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:teamStat,field:'position','errors')}">
                                    <input type="text" id="position" name="position" value="${fieldValue(bean:teamStat,field:'position')}" />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
