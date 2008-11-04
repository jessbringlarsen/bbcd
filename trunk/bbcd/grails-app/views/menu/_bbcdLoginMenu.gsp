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