<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <g:javascript library="application" />
        <g:javascript library="yui" />
        <modalbox:modalIncludes />		
        
        <!-- Skin CSS files resize.css must load before layout.css --> 
		<link rel="stylesheet" href="${createLinkTo(dir:'js/yui/2.5.2/assets/skins/sam',file:'resize.css')}" / >
		<link rel="stylesheet" href="${createLinkTo(dir:'js/yui/2.5.2/assets/skins/sam',file:'layout.css')}" / >
		
		<!-- Utility Dependencies --> 
		<g:javascript library="yui/2.5.2/yahoo-dom-event/yahoo-dom-event" />
		<g:javascript library="yui/2.5.2/dragdrop/dragdrop-min" />
		<g:javascript library="yui/2.5.2/element/element-beta-min" />
		
		<!-- Optional Animation Support--> 
		<!--g:javascript library="yui/2.5.2/animation/animation-min" /-->
		
		<!-- Source file for the Layout Manager --> 
		<g:javascript library="yui/2.5.2/layout/layout-beta-min" />

		<!-- Define main top menu  -->
		<!-- link rel="stylesheet" href="${createLinkTo(dir:'js/yui/2.5.2/menu/assets',file:'menu.css')}" / -->
		<!-- g:javascript library="yui/2.5.2/yahoo-dom-event/yahoo-dom-event" / -->
		<!-- g:javascript library="yui/2.5.2/container/container_core" /-->
		<!-- g:javascript library="yui/2.5.2/menu/menu" /-->
		<!-- g:javascript library="bbcd_menu" /-->

		<!-- JSON & ajax -->		
		<g:javascript library="yui/2.5.2/yahoo/yahoo-min" />
		<g:javascript library="yui/2.5.2/json/json-min" />
		
		<g:javascript library="main_layout" />
        
        <g:layoutHead />
    </head>
    <body class="yui-skin-sam"> 
    	<div id="top1">
		    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse justo nibh, pharetra at, adipiscing ullamcorper.</p>
		</div>
		<div id="bottom1">
		    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse justo nibh, pharetra at, adipiscing ullamcorper.</p>
		</div>
		<div id="right1">
			<g:isLoggedIn>
		    	<p>Velkommen <g:loggedInUserInfo field="userRealName"/></p>
        		<g:ifAllGranted role="ROLE_USER,ROLE_ADMIN">
        			<li><a href="/bbcd/admin/admin">Admin</a></li>
        		</g:ifAllGranted>
        		<li><a href="/bbcd/logout/index">Logout</a></li>
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
								<label for='j_username'>Brugernavn</label><br/>
								<input type='text' class='text_' name='j_username' id='j_username'  />
							</p>
							<p>
								<label for='j_password'>Kodeord</label><br/>
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
		</div>
		
		<div id="left1">
		    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse justo nibh, pharetra at, adipiscing ullamcorper.</p>
		    <!-- SNIPPED -->
		</div>
    	
    	<div id=center1>
      		<g:layoutBody />
      	</div>
        
        
    </body>	
</html>