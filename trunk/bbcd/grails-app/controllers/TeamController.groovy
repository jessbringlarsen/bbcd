class TeamController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ teamList: Team.list( params ) ]
    }

    def show = {
        def team = Team.get( params.id )

        if(!team) {
            flash.message = "Team not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ team : team ] }
    }

    def delete = {
        def team = Team.get( params.id )
        if(team) {
            team.delete()
            flash.message = "Team ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Team not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def team = Team.get( params.id )

        if(!team) {
            flash.message = "Team not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ team : team ]
        }
    }

    def update = {
        def team = Team.get( params.id )
        if(team) {
            team.properties = params
            if(!team.hasErrors() && team.save()) {
                flash.message = "Team ${params.id} updated"
                redirect(action:show,id:team.id)
            }
            else {
                render(view:'edit',model:[team:team])
            }
        }
        else {
            flash.message = "Team not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def team = new Team()
        team.properties = params
        return ['team':team]
    }

    def save = {
        def team = new Team(params)
        if(!team.hasErrors() && team.save()) {
            flash.message = "Team ${team.id} created"
            redirect(action:show,id:team.id)
        }
        else {
            render(view:'create',model:[team:team])
        }
    }
}
