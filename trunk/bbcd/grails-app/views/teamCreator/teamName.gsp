

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
            <g:form action="teamCreate">
                
               <tr class="prop">
                    <td valign="top" class="name">
                        <label for="teamName">Name:</label>
                    </td>
                    <td valign="top">
                        <input type="text" id="teamName" name="teamName"/>
                    </td>
                </tr>
                <g:submitButton name="getTeamName" value="Næste" />
             </g:form>
         </div>
    </body>
</html>
