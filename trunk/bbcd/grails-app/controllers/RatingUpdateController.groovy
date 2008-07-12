            
class RatingUpdateController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ ratingUpdateList: RatingUpdate.list( params ) ]
    }

    def show = {
        def ratingUpdate = RatingUpdate.get( params.id )

        if(!ratingUpdate) {
            flash.message = "RatingUpdate not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ ratingUpdate : ratingUpdate ] }
    }

    def delete = {
        def ratingUpdate = RatingUpdate.get( params.id )
        if(ratingUpdate) {
            ratingUpdate.delete()
            flash.message = "RatingUpdate ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "RatingUpdate not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def ratingUpdate = RatingUpdate.get( params.id )

        if(!ratingUpdate) {
            flash.message = "RatingUpdate not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ ratingUpdate : ratingUpdate ]
        }
    }

    def update = {
        def ratingUpdate = RatingUpdate.get( params.id )
        if(ratingUpdate) {
            ratingUpdate.properties = params
            if(!ratingUpdate.hasErrors() && ratingUpdate.save()) {
                flash.message = "RatingUpdate ${params.id} updated"
                redirect(action:show,id:ratingUpdate.id)
            }
            else {
                render(view:'edit',model:[ratingUpdate:ratingUpdate])
            }
        }
        else {
            flash.message = "RatingUpdate not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def ratingUpdate = new RatingUpdate()
        ratingUpdate.properties = params
        return ['ratingUpdate':ratingUpdate]
    }

    def save = {
        def ratingUpdate = new RatingUpdate(params)
        if(!ratingUpdate.hasErrors() && ratingUpdate.save()) {
            flash.message = "RatingUpdate ${ratingUpdate.id} created"
            redirect(action:show,id:ratingUpdate.id)
        }
        else {
            render(view:'create',model:[ratingUpdate:ratingUpdate])
        }
    }
}