

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Club</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Club List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Club</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${club}">
            <div class="errors">
                <g:renderErrors bean="${club}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:club,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:club,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="shortName">Short Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:club,field:'shortName','errors')}">
                                    <input type="text" id="shortName" name="shortName" value="${fieldValue(bean:club,field:'shortName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="union">Union:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:club,field:'union','errors')}">
                                    <g:select optionKey="id" from="${Idraetsforbund.list()}" name="union.id" value="${club?.union?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="xmlId">Xml Id:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:club,field:'xmlId','errors')}">
                                    <input type="text" id="xmlId" name="xmlId" value="${fieldValue(bean:club,field:'xmlId')}"/>
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
