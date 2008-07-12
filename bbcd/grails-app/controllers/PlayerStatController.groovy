            
class PlayerStatController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ playerStatList: PlayerStat.list( params ) ]
    }

    def show = {
        def playerStat = PlayerStat.get( params.id )

        if(!playerStat) {
            flash.message = "PlayerStat not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ playerStat : playerStat ] }
    }

    def delete = {
        def playerStat = PlayerStat.get( params.id )
        if(playerStat) {
            playerStat.delete()
            flash.message = "PlayerStat ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "PlayerStat not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def playerStat = PlayerStat.get( params.id )

        if(!playerStat) {
            flash.message = "PlayerStat not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ playerStat : playerStat ]
        }
    }

    def update = {
        def playerStat = PlayerStat.get( params.id )
        if(playerStat) {
            playerStat.properties = params
            if(!playerStat.hasErrors() && playerStat.save()) {
                flash.message = "PlayerStat ${params.id} updated"
                redirect(action:show,id:playerStat.id)
            }
            else {
                render(view:'edit',model:[playerStat:playerStat])
            }
        }
        else {
            flash.message = "PlayerStat not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def playerStat = new PlayerStat()
        playerStat.properties = params
        return ['playerStat':playerStat]
    }

    def save = {
        def playerStat = new PlayerStat(params)
        if(!playerStat.hasErrors() && playerStat.save()) {
            flash.message = "PlayerStat ${playerStat.id} created"
            redirect(action:show,id:playerStat.id)
        }
        else {
            render(view:'create',model:[playerStat:playerStat])
        }
    }
}