

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create LeagueParticipant</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LeagueParticipant List</g:link></span>
        </div>
        <div class="body">
            <h1>Create LeagueParticipant</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${leagueParticipant}">
            <div class="errors">
                <g:renderErrors bean="${leagueParticipant}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="league">League:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leagueParticipant,field:'league','errors')}">
                                    <g:select optionKey="id" from="${League.list()}" name="league.id" value="${leagueParticipant?.league?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="team">Team:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leagueParticipant,field:'team','errors')}">
                                    <g:select optionKey="id" from="${Team.list()}" name="team.id" value="${leagueParticipant?.team?.id}" ></g:select>
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
