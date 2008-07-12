            
class IdraetsforbundController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ idraetsforbundList: Idraetsforbund.list( params ) ]
    }

    def show = {
        def idraetsforbund = Idraetsforbund.get( params.id )

        if(!idraetsforbund) {
            flash.message = "Idraetsforbund not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ idraetsforbund : idraetsforbund ] }
    }

    def delete = {
        def idraetsforbund = Idraetsforbund.get( params.id )
        if(idraetsforbund) {
            idraetsforbund.delete()
            flash.message = "Idraetsforbund ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Idraetsforbund not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def idraetsforbund = Idraetsforbund.get( params.id )

        if(!idraetsforbund) {
            flash.message = "Idraetsforbund not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ idraetsforbund : idraetsforbund ]
        }
    }

    def update = {
        def idraetsforbund = Idraetsforbund.get( params.id )
        if(idraetsforbund) {
            idraetsforbund.properties = params
            if(!idraetsforbund.hasErrors() && idraetsforbund.save()) {
                flash.message = "Idraetsforbund ${params.id} updated"
                redirect(action:show,id:idraetsforbund.id)
            }
            else {
                render(view:'edit',model:[idraetsforbund:idraetsforbund])
            }
        }
        else {
            flash.message = "Idraetsforbund not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def idraetsforbund = new Idraetsforbund()
        idraetsforbund.properties = params
        return ['idraetsforbund':idraetsforbund]
    }

    def save = {
        def idraetsforbund = new Idraetsforbund(params)
        if(!idraetsforbund.hasErrors() && idraetsforbund.save()) {
            flash.message = "Idraetsforbund ${idraetsforbund.id} created"
            redirect(action:show,id:idraetsforbund.id)
        }
        else {
            render(view:'create',model:[idraetsforbund:idraetsforbund])
        }
    }
}