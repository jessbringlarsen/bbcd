class TeamStatController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        if(!params.sort) params.sort = "position"
        [ teamStatList: TeamStat.list( params ) ]
    }

    def show = {
        def teamStat = TeamStat.get( params.id )

        if(!teamStat) {
            flash.message = "TeamStat not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ teamStat : teamStat ] }
    }

    def delete = {
        def teamStat = TeamStat.get( params.id )
        if(teamStat) {
            teamStat.delete()
            flash.message = "TeamStat ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "TeamStat not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def teamStat = TeamStat.get( params.id )

        if(!teamStat) {
            flash.message = "TeamStat not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ teamStat : teamStat ]
        }
    }

    def update = {
        def teamStat = TeamStat.get( params.id )
        if(teamStat) {
            teamStat.properties = params
            if(!teamStat.hasErrors() && teamStat.save()) {
                flash.message = "TeamStat ${params.id} updated"
                redirect(action:show,id:teamStat.id)
            }
            else {
                render(view:'edit',model:[teamStat:teamStat])
            }
        }
        else {
            flash.message = "TeamStat not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def teamStat = new TeamStat()
        teamStat.properties = params
        return ['teamStat':teamStat]
    }

    def save = {
        def teamStat = new TeamStat(params)
        if(!teamStat.hasErrors() && teamStat.save()) {
            flash.message = "TeamStat ${teamStat.id} created"
            redirect(action:show,id:teamStat.id)
        }
        else {
            render(view:'create',model:[teamStat:teamStat])
        }
    }
}
