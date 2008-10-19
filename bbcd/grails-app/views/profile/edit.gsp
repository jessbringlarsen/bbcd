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
                <input type="hidden" name="roleId" id="roleId" value="-1" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username">Username:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'username','errors')}">
                                    <input type="text" id="username" name="username" value="${fieldValue(bean:profile,field:'username')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userRealName">User Real Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'userRealName','errors')}">
                                    <input type="text" id="userRealName" name="userRealName" value="${fieldValue(bean:profile,field:'userRealName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="passwd">Passwd:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'passwd','errors')}">
                                    <input type="text" id="passwd" name="passwd" value="${fieldValue(bean:profile,field:'passwd')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enabled">Enabled:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'enabled','errors')}">
                                    <g:checkBox name="enabled" value="${profile?.enabled}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authorities">Authorities:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'authorities','errors')}">
								
									<table id="roleListTable">
										<th>
											Rolle
										</th>
										<th>
											Beskrivelse
										</th
										<th></th>
										<g:each var="role" in="${profile.authorities}">
											<tr>
												<td>
													${role.authority}
												</td>
												<td>
													${role.description}
												</td>
												<td>
													<a href="removeRole?roleId=${role.id}&id=${profile.id}">Fjern</a> 
												</td>
											</tr>
										</g:each>
									</table>
									<g:select 
						          	 	id="roleList" 
						          	 	optionKey="id" 
						          	 	from="${missingRoles}"
						          	 	onchange="document.getElementById('roleId').value = this.value"
						          	 	noSelection="['-1':'- vælg rolle -']"/>
                                    <span class="button">
                                    	<g:actionSubmit action="addRole" value="Tilføj" />
                                    </span> 
						        </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:profile,field:'description')}"/>
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
                                    <label for="emailShow">Email Show:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'emailShow','errors')}">
                                    <g:checkBox name="emailShow" value="${profile?.emailShow}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pass">Pass:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:profile,field:'pass','errors')}">
                                    <input type="text" name="pass" id="pass" value="${fieldValue(bean:profile,field:'pass')}" />
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
        
        
         <script type="text/javascript">

			function addRole()
			{
				var roleListRef = Element.extend($('roleList'));
				var profileId = ${profile.id}
				
				${remoteFunction(action:'addRole', onSuccess:'updateRoles()', params:'\'roleId=\' + roleListRef.getValue() + \'&profileId=\' + profileId ' )}
		  	}   
		  	
		  	var callbacks = {
			    // Successful XHR response handler
			    success : function (o) {
			        var messages = [];
			
			        // Use the JSON Utility to parse the data returned from the server
			        try {
			            messages = YAHOO.lang.JSON.parse(o.responseText);
			        }
			        catch (x) {
			            alert("JSON Parse failed!");
			            return;
			        }
			
					for(var i=0; i< messages['roles'].size(); i++) {
						var m = messages['roles'][i];
		 	              
			            var elTR = $('roleListTable').insertRow( -1 );
					    
					    var elTD1 = elTR.insertCell( -1 ); 
					    elTD1.innerHTML = m.authority;
						
						var elTD2 = elTR.insertCell( -1 );
						elTD2.innerHTML = '<INPUT TYPE=BUTTON OnClick=\'YAHOO.util.Connect.asyncRequest(\'POST\',\'removeRole?profileId=1&roleId=2\', callbacks);\' VALUE=\'Fjern\'>';
						//elTD2.innerHTML = '<a href=\'/bbcd/profile/removeRole\' onclick=\'new Ajax.Request(\'/bbcd/profile/removeRole\',{asynchronous:true,evalScripts:true,parameters:profileId=1&roleId=2});return false;\'>Fjern</a>';
						//elTD2.innerHTML = ${remoteLink(action:'removeRole', params:'profileId=1&roleId=2')};
			        }
			    }
			};
			
		  // YAHOO.util.Connect.asyncRequest('GET',"listASJSON", callbacks);
		</script>
    </body>
</html>
