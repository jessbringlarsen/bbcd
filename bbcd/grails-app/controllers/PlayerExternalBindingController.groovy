

/**
 * E.g. http://localhost:8080/bbcd/playerExternalBinding/create?defaultClubXmlId=60806&externalId=jess
 */
class PlayerExternalBindingController {

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ playerExternalBindingList: PlayerExternalBinding.list( params ) ]
    }

    def show = {
        def playerExternalBinding = PlayerExternalBinding.get( params.id )

        if(!playerExternalBinding) {
            flash.message = "PlayerExternalBinding not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ playerExternalBinding : playerExternalBinding ] }
    }

    def delete = {
        def playerExternalBinding = PlayerExternalBinding.get( params.id )
        if(playerExternalBinding) {
            playerExternalBinding.delete()
            flash.message = "PlayerExternalBinding ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "PlayerExternalBinding not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def playerExternalBinding = PlayerExternalBinding.get( params.id )

        if(!playerExternalBinding) {
            flash.message = "PlayerExternalBinding not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ playerExternalBinding : playerExternalBinding ]
        }
    }

    def update = {
        def playerExternalBinding = PlayerExternalBinding.get( params.id )
        if(playerExternalBinding) {
            playerExternalBinding.properties = params
            if(!playerExternalBinding.hasErrors() && playerExternalBinding.save()) {
                flash.message = "PlayerExternalBinding ${params.id} updated"
                redirect(action:show,id:playerExternalBinding.id)
            }
            else {
                render(view:'edit',model:[playerExternalBinding:playerExternalBinding])
            }
        }
        else {
            flash.message = "PlayerExternalBinding not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    /**
     * Parametre:
     * defaultClubXmlId - default klub i drop box
     * externalId - id fra externt system
     */
    def create = {
    	def playerExternalBinding = new PlayerExternalBinding()
        playerExternalBinding.properties = params

        // Get clublist
        def clubList = Club.list(sort:'name')
        def defaultClubMap = ['-1' : 'Vælg klub...']
    	def playerList

    	// Get defaultclub
    	if(params.defaultClubXmlId) {
	    	def defaultClub = Club.findByXmlId(params.defaultClubXmlId)

	    	if(defaultClub != null) {
	        	defaultClubMap = ["${defaultClub.id}" : defaultClub.name]

	        	// Load players for default club
	        	playerList = new PlayerService().getByClubMinusPlayerExternalBinding(defaultClub.id) //getByClub(defaultClub.id)
	        }
    	}

        return ['playerExternalBinding' : playerExternalBinding,
                clubList : clubList,
                defaultClub : defaultClubMap,
                playerList : playerList]
    }

    /**
     * Receieve a club.id and return a g:select element with players in the club.
     */
    def updatePlayers = {
    	def param = params
		if(params.clubId && params.clubId != "-1") {
			def playerList = new PlayerService().getByClubMinusPlayerExternalBinding(params.clubId)

			render g.select(
					optionKey: 'id',
					from: playerList,
					name: 'player.id',
					value: 'playerExternalBinding?.player?.id')
		}
    }

    def save = {
    	def param = params
        def playerExternalBinding = new PlayerExternalBinding(params)
        if(!playerExternalBinding.hasErrors() && playerExternalBinding.save()) {
            flash.message = "PlayerExternalBinding ${playerExternalBinding.id} created"
            redirect(action:show,id:playerExternalBinding.id)
        } else {
            render(view:'create',model:[playerExternalBinding:playerExternalBinding])
        }
    }
}