<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'js/yui/2.5.2/menu/assets',file:'menu.css')}" / >
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" / >
        <!-- link rel="stylesheet" href="${createLinkTo(dir:'css',file:'mainlayout.css')}" / -->
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        
        <g:layoutHead />
        <g:javascript library="application" />
        <g:javascript library="yui" />
        <modalbox:modalIncludes />		
    </head>
    <body>
    	<div id="bbcdmenuitems" class="yuimenubar yuimenubarnav"> 
		    <div class="bd"> 
		        <ul class="first-of-type"> 
		            <li class="yuimenubaritem first-of-type"> 
		                <a class="yuimenubaritemlabel" href="${createLinkTo(dir:'')}">Forside</a> 
		            </li> 
		            <li class="yuimenubaritem"> 
		                <a class="yuimenubaritemlabel" href="http://shopping.yahoo.com">Shopping</a> 
		            </li> 
		            <li class="yuimenubaritem"> 
		                <a class="yuimenubaritemlabel" href="http://entertainment.yahoo.com">Entertainment</a> 
		            </li> 
		            <li class="yuimenubaritem"> 
		                <a class="yuimenubaritemlabel" href="#">Information</a> 
		            </li> 
		            <g:ifAllGranted role="ROLE_USER, ROLE_ADMIN">
		            	<li class="yuimenubaritem"> 
		                	<a class="yuimenubaritemlabel" href="<g:createLink controller="admin" action="admin" />">Administration</a> 
		            	</li>
		            </g:ifAllGranted>
		        </ul> 
		    </div> 
		</div>			
      	
      	<g:layoutBody />
        
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
						<div class='errors'>${flash.message}</div>
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
				<modalbox:createLink url="/bbcd/register/index" title="Opret konto" width="350" linkname="Opret konto" />
        	</div>
        </g:isNotLoggedIn>
    </body>	
</html>

<!-- Define main top menu  -->
<g:javascript library="yui/2.5.2/yahoo-dom-event/yahoo-dom-event" />
<g:javascript library="yui/2.5.2/container/container_core" />
<g:javascript library="yui/2.5.2/menu/menu" />
<g:javascript library="bbcd_menu" />