class LicenseClassPriceController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ licenseClassPriceList: LicenseClassPrice.list( params ) ]
    }

    def show = {
        def licenseClassPrice = LicenseClassPrice.get( params.id )

        if(!licenseClassPrice) {
            flash.message = "LicenseClassPrice not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ licenseClassPrice : licenseClassPrice ] }
    }

    def delete = {
        def licenseClassPrice = LicenseClassPrice.get( params.id )
        if(licenseClassPrice) {
            licenseClassPrice.delete()
            flash.message = "LicenseClassPrice ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "LicenseClassPrice not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def licenseClassPrice = LicenseClassPrice.get( params.id )

        if(!licenseClassPrice) {
            flash.message = "LicenseClassPrice not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ licenseClassPrice : licenseClassPrice ]
        }
    }

    def update = {
        def licenseClassPrice = LicenseClassPrice.get( params.id )
        if(licenseClassPrice) {
            licenseClassPrice.properties = params
            if(!licenseClassPrice.hasErrors() && licenseClassPrice.save()) {
                flash.message = "LicenseClassPrice ${params.id} updated"
                redirect(action:show,id:licenseClassPrice.id)
            }
            else {
                render(view:'edit',model:[licenseClassPrice:licenseClassPrice])
            }
        }
        else {
            flash.message = "LicenseClassPrice not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def licenseClassPrice = new LicenseClassPrice()
        licenseClassPrice.properties = params
        return ['licenseClassPrice':licenseClassPrice]
    }

    def save = {
        def licenseClassPrice = new LicenseClassPrice(params)
        if(!licenseClassPrice.hasErrors() && licenseClassPrice.save()) {
            flash.message = "LicenseClassPrice ${licenseClassPrice.id} created"
            redirect(action:show,id:licenseClassPrice.id)
        }
        else {
            render(view:'create',model:[licenseClassPrice:licenseClassPrice])
        }
    }
}
