class AuthentificationController {
    def beforeInterceptor = [action:this.&checkUser,except:['index', 'login', 'doLogin']]

    def scaffold = false

    def checkUser() {
        if(!session.user) {
        	// i.e. user not logged in
            redirect(controller:'profile',action:'login')
            return false
        }
  	}

    def login = {}

    def doLogin = {
	 /* def user = User.findWhere(email:params['email'], password:params['password'])
	  session.user = user
	  if (user)
	              redirect(controller:'profile',action:'list')
	        else
	              redirect(controller:'profile',action:'login')
	              */
	    session.user = new Profile()
		redirect(controller:'profile',action:'list')
	}
}