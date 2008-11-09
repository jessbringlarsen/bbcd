class LicenseClassController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ licenseClassList: LicenseClass.list( params ) ]
    }

    def show = {
        def licenseClass = LicenseClass.get( params.id )

        if(!licenseClass) {
            flash.message = "LicenseClass not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ licenseClass : licenseClass ] }
    }

    def delete = {
        def licenseClass = LicenseClass.get( params.id )
        if(licenseClass) {
            licenseClass.delete()
            flash.message = "LicenseClass ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "LicenseClass not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def licenseClass = LicenseClass.get( params.id )

        if(!licenseClass) {
            flash.message = "LicenseClass not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ licenseClass : licenseClass ]
        }
    }

    def update = {
        def licenseClass = LicenseClass.get( params.id )
        if(licenseClass) {
            licenseClass.properties = params
            if(!licenseClass.hasErrors() && licenseClass.save()) {
                flash.message = "LicenseClass ${params.id} updated"
                redirect(action:show,id:licenseClass.id)
            }
            else {
                render(view:'edit',model:[licenseClass:licenseClass])
            }
        }
        else {
            flash.message = "LicenseClass not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def licenseClass = new LicenseClass()
        licenseClass.properties = params
        return ['licenseClass':licenseClass]
    }

    def save = {
        def licenseClass = new LicenseClass(params)
        if(!licenseClass.hasErrors() && licenseClass.save()) {
            flash.message = "LicenseClass ${licenseClass.id} created"
            redirect(action:show,id:licenseClass.id)
        }
        else {
            render(view:'create',model:[licenseClass:licenseClass])
        }
    }
}
