

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Profile</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Profile List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Profile</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Profile</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${profile}">
            <div class="errors">
                <g:renderErrors bean="${profile}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${profile?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="activated">Activated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'activated','errors')}">
                                    <input type="text" id="activated" name="activated" value="${fieldValue(bean:profile,field:'activated')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="activationKey">Activation Key:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'activationKey','errors')}">
                                    <input type="text" id="activationKey" name="activationKey" value="${fieldValue(bean:profile,field:'activationKey')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="answer">Answer:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'answer','errors')}">
                                    <input type="text" id="answer" name="answer" value="${fieldValue(bean:profile,field:'answer')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:profile,field:'email')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName">Firstname:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'firstName','errors')}">
                                    <input type="text" id="firstName" name="firstName" value="${fieldValue(bean:profile,field:'firstName')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastLogin">Last Login:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'lastLogin','errors')}">
                                    <g:datePicker name="lastLogin" value="${profile?.lastLogin}" ></g:datePicker>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'password','errors')}">
                                    <input type="text" id="password" name="password" value="${fieldValue(bean:profile,field:'password')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="question">Question:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'question','errors')}">
                                    <input type="text" id="question" name="question" value="${fieldValue(bean:profile,field:'question')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sirName">Sirname:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'sirName','errors')}">
                                    <input type="text" id="sirName" name="sirName" value="${fieldValue(bean:profile,field:'sirName')}"/>
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
