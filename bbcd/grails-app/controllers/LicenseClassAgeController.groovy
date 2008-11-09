class LicenseClassAgeController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ licenseClassAgeList: LicenseClassAge.list( params ) ]
    }

    def show = {
        def licenseClassAge = LicenseClassAge.get( params.id )

        if(!licenseClassAge) {
            flash.message = "LicenseClassAge not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ licenseClassAge : licenseClassAge ] }
    }

    def delete = {
        def licenseClassAge = LicenseClassAge.get( params.id )
        if(licenseClassAge) {
            licenseClassAge.delete()
            flash.message = "LicenseClassAge ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "LicenseClassAge not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def licenseClassAge = LicenseClassAge.get( params.id )

        if(!licenseClassAge) {
            flash.message = "LicenseClassAge not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ licenseClassAge : licenseClassAge ]
        }
    }

    def update = {
        def licenseClassAge = LicenseClassAge.get( params.id )
        if(licenseClassAge) {
            licenseClassAge.properties = params
            if(!licenseClassAge.hasErrors() && licenseClassAge.save()) {
                flash.message = "LicenseClassAge ${params.id} updated"
                redirect(action:show,id:licenseClassAge.id)
            }
            else {
                render(view:'edit',model:[licenseClassAge:licenseClassAge])
            }
        }
        else {
            flash.message = "LicenseClassAge not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def licenseClassAge = new LicenseClassAge()
        licenseClassAge.properties = params
        return ['licenseClassAge':licenseClassAge]
    }

    def save = {
        def licenseClassAge = new LicenseClassAge(params)
        if(!licenseClassAge.hasErrors() && licenseClassAge.save()) {
            flash.message = "LicenseClassAge ${licenseClassAge.id} created"
            redirect(action:show,id:licenseClassAge.id)
        }
        else {
            render(view:'create',model:[licenseClassAge:licenseClassAge])
        }
    }
}
