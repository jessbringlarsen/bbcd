class LeagueForumMessageController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ leagueForumMessageList: LeagueForumMessage.list( params ) ]
    }

    def show = {
        def leagueForumMessage = LeagueForumMessage.get( params.id )

        if(!leagueForumMessage) {
            flash.message = "LeagueForumMessage not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ leagueForumMessage : leagueForumMessage ] }
    }

    def delete = {
        def leagueForumMessage = LeagueForumMessage.get( params.id )
        if(leagueForumMessage) {
            leagueForumMessage.delete()
            flash.message = "LeagueForumMessage ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "LeagueForumMessage not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def leagueForumMessage = LeagueForumMessage.get( params.id )

        if(!leagueForumMessage) {
            flash.message = "LeagueForumMessage not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ leagueForumMessage : leagueForumMessage ]
        }
    }

    def update = {
        def leagueForumMessage = LeagueForumMessage.get( params.id )
        if(leagueForumMessage) {
            leagueForumMessage.properties = params
            if(!leagueForumMessage.hasErrors() && leagueForumMessage.save()) {
                flash.message = "LeagueForumMessage ${params.id} updated"
                redirect(action:show,id:leagueForumMessage.id)
            }
            else {
                render(view:'edit',model:[leagueForumMessage:leagueForumMessage])
            }
        }
        else {
            flash.message = "LeagueForumMessage not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def leagueForumMessage = new LeagueForumMessage()
        leagueForumMessage.properties = params
        return ['leagueForumMessage':leagueForumMessage]
    }

    def save = {
        def leagueForumMessage = new LeagueForumMessage(params)
        if(!leagueForumMessage.hasErrors() && leagueForumMessage.save()) {
            flash.message = "LeagueForumMessage ${leagueForumMessage.id} created"
            redirect(action:show,id:leagueForumMessage.id)
        }
        else {
            render(view:'create',model:[leagueForumMessage:leagueForumMessage])
        }
    }
}
