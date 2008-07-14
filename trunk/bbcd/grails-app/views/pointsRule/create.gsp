

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create PointsRule</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">PointsRule List</g:link></span>
        </div>
        <div class="body">
            <h1>Create PointsRule</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${pointsRule}">
            <div class="errors">
                <g:renderErrors bean="${pointsRule}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="credit">Credit:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:pointsRule,field:'credit','errors')}">
                                    <input type="text" id="credit" name="credit" value="${fieldValue(bean:pointsRule,field:'credit')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fromRating">From Rating:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:pointsRule,field:'fromRating','errors')}">
                                    <input type="text" id="fromRating" name="fromRating" value="${fieldValue(bean:pointsRule,field:'fromRating')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="toRating">To Rating:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:pointsRule,field:'toRating','errors')}">
                                    <input type="text" id="toRating" name="toRating" value="${fieldValue(bean:pointsRule,field:'toRating')}" />
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
