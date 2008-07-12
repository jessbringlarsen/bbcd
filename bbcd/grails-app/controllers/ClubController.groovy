
class ClubController {

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ clubList: Club.list( params ) ]
    }

    def show = {
        def club = Club.get( params.id )

        if(!club) {
            flash.message = "Club not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ club : club ] }
    }

    def delete = {
        def club = Club.get( params.id )
        if(club) {
            club.delete()
            flash.message = "Club ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Club not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def club = Club.get( params.id )

        if(!club) {
            flash.message = "Club not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ club : club ]
        }
    }

    def update = {
        def club = Club.get( params.id )
        if(club) {
            club.properties = params
            if(!club.hasErrors() && club.save()) {
                flash.message = "Club ${params.id} updated"
                redirect(action:show,id:club.id)
            }
            else {
                render(view:'edit',model:[club:club])
            }
        }
        else {
            flash.message = "Club not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def club = new Club()
        club.properties = params
        return ['club':club]
    }

    def save = {
        def club = new Club(params)
        if(!club.hasErrors() && club.save()) {
            flash.message = "Club ${club.id} created"
            redirect(action:show,id:club.id)
        }
        else {
            render(view:'create',model:[club:club])
        }
    }
}