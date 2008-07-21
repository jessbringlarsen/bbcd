

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit LeagueStat</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LeagueStat List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New LeagueStat</g:link></span>
        </div>
        <div class="body">
            <h1>Edit LeagueStat</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${leagueStat}">
            <div class="errors">
                <g:renderErrors bean="${leagueStat}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${leagueStat?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="league">League:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leagueStat,field:'league','errors')}">
                                    <g:select optionKey="id" from="${League.list()}" name="league.id" value="${leagueStat?.league?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ratingUpdate">Rating Update:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leagueStat,field:'ratingUpdate','errors')}">
                                    <g:select optionKey="id" from="${RatingUpdate.list()}" name="ratingUpdate.id" value="${leagueStat?.ratingUpdate?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ratingStatus">Rating Status:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leagueStat,field:'ratingStatus','errors')}">
                                    <input type="text" id="ratingStatus" name="ratingStatus" value="${fieldValue(bean:leagueStat,field:'ratingStatus')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="creditStatus">Credit Status:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leagueStat,field:'creditStatus','errors')}">
                                    <input type="text" id="creditStatus" name="creditStatus" value="${fieldValue(bean:leagueStat,field:'creditStatus')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="position">Position:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:leagueStat,field:'position','errors')}">
                                    <input type="text" id="position" name="position" value="${fieldValue(bean:leagueStat,field:'position')}" />
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
