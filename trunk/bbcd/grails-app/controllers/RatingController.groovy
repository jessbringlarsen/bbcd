
class RatingController {

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ ratingList: Rating.list( params ) ]
    }

    def show = {
        def rating = Rating.get( params.id )

        if(!rating) {
            flash.message = "Rating not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ rating : rating ] }
    }

    def delete = {
        def rating = Rating.get( params.id )
        if(rating) {
            rating.delete()
            flash.message = "Rating ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Rating not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def rating = Rating.get( params.id )

        if(!rating) {
            flash.message = "Rating not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ rating : rating ]
        }
    }

    def update = {
        def rating = Rating.get( params.id )
        if(rating) {
            rating.properties = params
            if(!rating.hasErrors() && rating.save()) {
                flash.message = "Rating ${params.id} updated"
                redirect(action:show,id:rating.id)
            }
            else {
                render(view:'edit',model:[rating:rating])
            }
        }
        else {
            flash.message = "Rating not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def rating = new Rating()
        rating.properties = params
        return ['rating':rating]
    }

    def save = {
        def rating = new Rating(params)
        if(!rating.hasErrors() && rating.save()) {
            flash.message = "Rating ${rating.id} created"
            redirect(action:show,id:rating.id)
        }
        else {
            render(view:'create',model:[rating:rating])
        }
    }
}