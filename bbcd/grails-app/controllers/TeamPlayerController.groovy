class TeamPlayerController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ teamPlayerList: TeamPlayer.list( params ) ]
    }

    def show = {
        def teamPlayer = TeamPlayer.get( params.id )

        if(!teamPlayer) {
            flash.message = "TeamPlayer not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ teamPlayer : teamPlayer ] }
    }

    def delete = {
        def teamPlayer = TeamPlayer.get( params.id )
        if(teamPlayer) {
            teamPlayer.delete()
            flash.message = "TeamPlayer ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "TeamPlayer not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def teamPlayer = TeamPlayer.get( params.id )

        if(!teamPlayer) {
            flash.message = "TeamPlayer not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ teamPlayer : teamPlayer ]
        }
    }

    def update = {
        def teamPlayer = TeamPlayer.get( params.id )
        if(teamPlayer) {
            teamPlayer.properties = params
            if(!teamPlayer.hasErrors() && teamPlayer.save()) {
                flash.message = "TeamPlayer ${params.id} updated"
                redirect(action:show,id:teamPlayer.id)
            }
            else {
                render(view:'edit',model:[teamPlayer:teamPlayer])
            }
        }
        else {
            flash.message = "TeamPlayer not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def teamPlayer = new TeamPlayer()
        teamPlayer.properties = params
        return ['teamPlayer':teamPlayer]
    }

    def save = {
        def teamPlayer = new TeamPlayer(params)
        if(!teamPlayer.hasErrors() && teamPlayer.save()) {
            flash.message = "TeamPlayer ${teamPlayer.id} created"
            redirect(action:show,id:teamPlayer.id)
        }
        else {
            render(view:'create',model:[teamPlayer:teamPlayer])
        }
    }
}
