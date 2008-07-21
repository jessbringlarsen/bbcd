class LeagueStatController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ leagueStatList: LeagueStat.list( params ) ]
    }

    def show = {
        def leagueStat = LeagueStat.get( params.id )

        if(!leagueStat) {
            flash.message = "LeagueStat not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ leagueStat : leagueStat ] }
    }

    def delete = {
        def leagueStat = LeagueStat.get( params.id )
        if(leagueStat) {
            leagueStat.delete()
            flash.message = "LeagueStat ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "LeagueStat not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def leagueStat = LeagueStat.get( params.id )

        if(!leagueStat) {
            flash.message = "LeagueStat not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ leagueStat : leagueStat ]
        }
    }

    def update = {
        def leagueStat = LeagueStat.get( params.id )
        if(leagueStat) {
            leagueStat.properties = params
            if(!leagueStat.hasErrors() && leagueStat.save()) {
                flash.message = "LeagueStat ${params.id} updated"
                redirect(action:show,id:leagueStat.id)
            }
            else {
                render(view:'edit',model:[leagueStat:leagueStat])
            }
        }
        else {
            flash.message = "LeagueStat not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def leagueStat = new LeagueStat()
        leagueStat.properties = params
        return ['leagueStat':leagueStat]
    }

    def save = {
        def leagueStat = new LeagueStat(params)
        if(!leagueStat.hasErrors() && leagueStat.save()) {
            flash.message = "LeagueStat ${leagueStat.id} created"
            redirect(action:show,id:leagueStat.id)
        }
        else {
            render(view:'create',model:[leagueStat:leagueStat])
        }
    }
}
