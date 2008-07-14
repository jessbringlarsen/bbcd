class PointsRuleController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ pointsRuleList: PointsRule.list( params ) ]
    }

    def show = {
        def pointsRule = PointsRule.get( params.id )

        if(!pointsRule) {
            flash.message = "PointsRule not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ pointsRule : pointsRule ] }
    }

    def delete = {
        def pointsRule = PointsRule.get( params.id )
        if(pointsRule) {
            pointsRule.delete()
            flash.message = "PointsRule ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "PointsRule not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def pointsRule = PointsRule.get( params.id )

        if(!pointsRule) {
            flash.message = "PointsRule not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ pointsRule : pointsRule ]
        }
    }

    def update = {
        def pointsRule = PointsRule.get( params.id )
        if(pointsRule) {
            pointsRule.properties = params
            if(!pointsRule.hasErrors() && pointsRule.save()) {
                flash.message = "PointsRule ${params.id} updated"
                redirect(action:show,id:pointsRule.id)
            }
            else {
                render(view:'edit',model:[pointsRule:pointsRule])
            }
        }
        else {
            flash.message = "PointsRule not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def pointsRule = new PointsRule()
        pointsRule.properties = params
        return ['pointsRule':pointsRule]
    }

    def save = {
        def pointsRule = new PointsRule(params)
        if(!pointsRule.hasErrors() && pointsRule.save()) {
            flash.message = "PointsRule ${pointsRule.id} created"
            redirect(action:show,id:pointsRule.id)
        }
        else {
            render(view:'create',model:[pointsRule:pointsRule])
        }
    }
}
