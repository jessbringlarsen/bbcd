class LeagueParticipantController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ leagueParticipantList: LeagueParticipant.list( params ) ]
    }

    def show = {
        def leagueParticipant = LeagueParticipant.get( params.id )

        if(!leagueParticipant) {
            flash.message = "LeagueParticipant not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ leagueParticipant : leagueParticipant ] }
    }

    def delete = {
        def leagueParticipant = LeagueParticipant.get( params.id )
        if(leagueParticipant) {
            leagueParticipant.delete()
            flash.message = "LeagueParticipant ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "LeagueParticipant not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def leagueParticipant = LeagueParticipant.get( params.id )

        if(!leagueParticipant) {
            flash.message = "LeagueParticipant not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ leagueParticipant : leagueParticipant ]
        }
    }

    def update = {
        def leagueParticipant = LeagueParticipant.get( params.id )
        if(leagueParticipant) {
            leagueParticipant.properties = params
            if(!leagueParticipant.hasErrors() && leagueParticipant.save()) {
                flash.message = "LeagueParticipant ${params.id} updated"
                redirect(action:show,id:leagueParticipant.id)
            }
            else {
                render(view:'edit',model:[leagueParticipant:leagueParticipant])
            }
        }
        else {
            flash.message = "LeagueParticipant not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def leagueParticipant = new LeagueParticipant()
        leagueParticipant.properties = params
        return ['leagueParticipant':leagueParticipant]
    }

    def save = {
        def leagueParticipant = new LeagueParticipant(params)
        if(!leagueParticipant.hasErrors() && leagueParticipant.save()) {
            flash.message = "LeagueParticipant ${leagueParticipant.id} created"
            redirect(action:show,id:leagueParticipant.id)
        }
        else {
            render(view:'create',model:[leagueParticipant:leagueParticipant])
        }
    }
}
