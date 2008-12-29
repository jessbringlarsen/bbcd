

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Opret Hold</title>
    </head>
    <body>
        <div class="body">
            <h1>Hold Oprettelse</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
             <g:hasErrors bean="${team}">
            <div class="errors">
                <g:renderErrors bean="${team}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="createTeam">
               <table>
               <tr class="prop">
                    <td valign="top" class="name">
                        <label for="teamName">Angiv hold navn:</label>
                    </td>
                    <td valign="top">
                        <input type="text" id="teamName" name="teamName" value="${fieldValue(bean:team,field:'name')}" />
                    </td>
                </tr>
                 <tr class="prop">
                     <td></td>
                    <td>
                        <g:submitButton name="getTeamName" value="Næste" />
                    </td>
                </tr>
                </table>
             </g:form>
         </div>
    </body>
</html>
