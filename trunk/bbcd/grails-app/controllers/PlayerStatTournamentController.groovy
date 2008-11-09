class PlayerStatTournamentController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ playerStatTournamentList: PlayerStatTournament.list( params ) ]
    }

    def show = {
        def playerStatTournament = PlayerStatTournament.get( params.id )

        if(!playerStatTournament) {
            flash.message = "PlayerStatTournament not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ playerStatTournament : playerStatTournament ] }
    }

    def delete = {
        def playerStatTournament = PlayerStatTournament.get( params.id )
        if(playerStatTournament) {
            playerStatTournament.delete()
            flash.message = "PlayerStatTournament ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "PlayerStatTournament not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def playerStatTournament = PlayerStatTournament.get( params.id )

        if(!playerStatTournament) {
            flash.message = "PlayerStatTournament not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ playerStatTournament : playerStatTournament ]
        }
    }

    def update = {
        def playerStatTournament = PlayerStatTournament.get( params.id )
        if(playerStatTournament) {
            playerStatTournament.properties = params
            if(!playerStatTournament.hasErrors() && playerStatTournament.save()) {
                flash.message = "PlayerStatTournament ${params.id} updated"
                redirect(action:show,id:playerStatTournament.id)
            }
            else {
                render(view:'edit',model:[playerStatTournament:playerStatTournament])
            }
        }
        else {
            flash.message = "PlayerStatTournament not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def playerStatTournament = new PlayerStatTournament()
        playerStatTournament.properties = params
        return ['playerStatTournament':playerStatTournament]
    }

    def save = {
        def playerStatTournament = new PlayerStatTournament(params)
        if(!playerStatTournament.hasErrors() && playerStatTournament.save()) {
            flash.message = "PlayerStatTournament ${playerStatTournament.id} created"
            redirect(action:show,id:playerStatTournament.id)
        }
        else {
            render(view:'create',model:[playerStatTournament:playerStatTournament])
        }
    }
}
