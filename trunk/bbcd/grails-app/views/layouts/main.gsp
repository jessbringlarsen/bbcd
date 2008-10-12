<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />				
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>	
        <div class="logo">
        	<img src="${createLinkTo(dir:'images',file:'grails_logo.jpg')}" alt="Grails" />
        </div>	
        <div class="pageContent">
        	<g:layoutBody />	
        </div>	
        <g:isLoggedIn>
        	<div class="userDetails">
        		<h3>Velkommen <g:loggedInUserInfo field="userRealName"/></h3>
        		<g:ifAllGranted role="ROLE_USER,ROLE_ADMIN">
        			<li><a href="/bbcd/admin/admin">Admin</a></li>
        		</g:ifAllGranted>
        		<li><a href="/bbcd/logout/index">Logout</a></li>
        	</div>
        </g:isLoggedIn>
        <g:isNotLoggedIn>
        	<div class="userDetails">
        		<div id='login'>
					<div class='inner'>
					<g:if test='${flash.message}'>
						<div class='login_message'>${flash.message}</div>
					</g:if>
					<form action='${request.contextPath}/j_spring_security_check' method='POST' id='loginForm' class='cssform'>
						<p>
							<label for='j_username'>Brugernavn</label>
							<input type='text' class='text_' name='j_username' id='j_username'  />
						</p>
						<p>
							<label for='j_password'>Kodeord</label>
							<input type='password' class='text_' name='j_password' id='j_password' />
						</p>
						<p>
							<label for='remember_me'>Husk mig</label>
							<input type='checkbox' style="height:12px;" id='remember_me' name='_spring_security_remember_me'>
						</p>
						<p>
							<input type='submit' value='Login' />
						</p>
					</form>
					</div>
				</div>
				<a href="/bbcd/logout/index">Opret konto</a>
        	</div>
        </g:isNotLoggedIn>
    </body>	
</html>