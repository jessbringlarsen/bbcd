

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Rating</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Rating List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Rating</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${rating}">
            <div class="errors">
                <g:renderErrors bean="${rating}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="club">Club:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:rating,field:'club','errors')}">
                                    <g:select optionKey="id" from="${Club.list()}" name="club.id" value="${rating?.club?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="player">Player:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:rating,field:'player','errors')}">
                                    <g:select optionKey="id" from="${Player.list()}" name="player.id" value="${rating?.player?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rating">Rating:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:rating,field:'rating','errors')}">
                                    <input type="text" id="rating" name="rating" value="${fieldValue(bean:rating,field:'rating')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ratingUpdate">Rating Update:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:rating,field:'ratingUpdate','errors')}">
                                    <g:select optionKey="id" from="${RatingUpdate.list()}" name="ratingUpdate.id" value="${rating?.ratingUpdate?.id}" ></g:select>
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
