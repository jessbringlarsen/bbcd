class LeagueController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ leagueList: League.list( params ) ]
    }

    def show = {
        def league = League.get( params.id )

        if(!league) {
            flash.message = "League not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ league : league ] }
    }

    def delete = {
        def league = League.get( params.id )
        if(league) {
            league.delete()
            flash.message = "League ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "League not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def league = League.get( params.id )

        if(!league) {
            flash.message = "League not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ league : league ]
        }
    }

    def update = {
        def league = League.get( params.id )
        if(league) {
        	/*
        	 * Encode password if changed 
        	 */
        	String passwordEncoded = params.password.encodeAsPassword()
        	if(!profile.password.isEmpty() && !profile.password.equals(passwordEncoded)) {
        		params.password = passwordEncoded
        	}
        	
            league.properties = params
            if(!league.hasErrors() && league.save()) {
                flash.message = "League ${params.id} updated"
                redirect(action:show,id:league.id)
            }
            else {
                render(view:'edit',model:[league:league])
            }
        }
        else {
            flash.message = "League not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def league = new League()
        league.properties = params
        return ['league':league]
    }

    def save = {
        def league = new League(params)
        if(!league.hasErrors() && league.save()) {
        	
        	if(!profile.password.isEmpty()) {
        		profile.password = profile.password.encodeAsPassword()
        	}
        	
            flash.message = "League ${league.id} created"
            redirect(action:show,id:league.id)
        }
        else {
            render(view:'create',model:[league:league])
        }
    }
}
