class TournamentController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ tournamentList: Tournament.list( params ) ]
    }

    def show = {
        def tournament = Tournament.get( params.id )

        if(!tournament) {
            flash.message = "Tournament not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ tournament : tournament ] }
    }

    def delete = {
        def tournament = Tournament.get( params.id )
        if(tournament) {
            tournament.delete()
            flash.message = "Tournament ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Tournament not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def tournament = Tournament.get( params.id )

        if(!tournament) {
            flash.message = "Tournament not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ tournament : tournament ]
        }
    }

    def update = {
        def tournament = Tournament.get( params.id )
        if(tournament) {
            tournament.properties = params
            if(!tournament.hasErrors() && tournament.save()) {
                flash.message = "Tournament ${params.id} updated"
                redirect(action:show,id:tournament.id)
            }
            else {
                render(view:'edit',model:[tournament:tournament])
            }
        }
        else {
            flash.message = "Tournament not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def tournament = new Tournament()
        tournament.properties = params
        return ['tournament':tournament]
    }

    def save = {
        def tournament = new Tournament(params)
        if(!tournament.hasErrors() && tournament.save()) {
            flash.message = "Tournament ${tournament.id} created"
            redirect(action:show,id:tournament.id)
        }
        else {
            render(view:'create',model:[tournament:tournament])
        }
    }
}
