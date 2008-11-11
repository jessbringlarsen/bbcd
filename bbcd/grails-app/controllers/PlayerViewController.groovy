class PlayerViewController {
    
    def index = { redirect(action:list,params:params) }

    def list = {
        if(!params.max) params.max = 10
        [ playerViewList: PlayerView.list( params ) ]
    }
}
