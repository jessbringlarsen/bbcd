

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Profile List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Profile</g:link></span>
        </div>
        <div class="body">
            <h1>Profile List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                   	        <g:sortableColumn property="id" title="Id" />

                   	        <g:sortableColumn property="activated" title="Activated" />

                   	        <g:sortableColumn property="activationKey" title="Activation Key" />

                   	        <g:sortableColumn property="answer" title="Answer" />

                   	        <g:sortableColumn property="email" title="Email" />

                   	        <g:sortableColumn property="firstName" title="Firstname" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${profileList}" status="i" var="profile">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${profile.id}">${profile.id?.encodeAsHTML()}</g:link></td>

                            <td>${profile.activated?.encodeAsHTML()}</td>

                            <td>${profile.activationKey?.encodeAsHTML()}</td>

                            <td>${profile.answer?.encodeAsHTML()}</td>

                            <td>${profile.email?.encodeAsHTML()}</td>

                            <td>${profile.firstName?.encodeAsHTML()}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Profile.count()}" />
            </div>
        </div>
    </body>
</html>
