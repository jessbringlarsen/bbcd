import grails.converters.JSON

// Controller responsible for creating a team and adding player to it 
class TeamCreatorController {
    def playerViewService
    def authenticateService
    
    def index = {
        render(view:"teamName")
    }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def createTeam = {
        def teamName = params.teamName
        def currentUser = authenticateService.principal()
        Profile profile = Profile.findByUsername(currentUser.getUsername())

        if(profile != null) {
            def team = new Team(name: teamName, teamOwner:profile, creationDate:new Date(), credit:new Integer(1500))
            if(!team.hasErrors() && team.save()) {
                session.teamId = team.id
                redirect(action:editTeam)
            } else {
                render(view:'teamName',model:[team:team])
            }
        } else {
            flash.message = "${currentUser} ikke fundet!"
            render(view:'teamName')
        }
    }

    def editTeam = {
        def playerViewList = PlayerView.list()
        def licenceClassPriceList = LicenseClassPrice.list()
        [playerViewList:playerViewList, clubList:Club.list(), priceList:licenceClassPriceList]
    }

    def addPlayerToTeam = {
        def team = Team.get(session.teamId)
        def playerToAdd = Player.findById(params.id)
        team.addToPlayers(playerToAdd)

        def result = playerViewService.getByTeam(session.teamId)
        render(view:"boughtPlayerTable", model: [ playerViewList:result ])
    }

     def removePlayerFromTeam = {
        def team = Team.get(session.teamId)
        def playerToAdd = Player.findById(params.id)
        team.removeFromPlayers(playerToAdd)

        def result = playerViewService.getByTeam(session.teamId)
        render(view:"boughtPlayerTable", model: [ playerViewList:result ])
    }

    def getTeamPlayers = {
        def result = playerViewService.getByTeam(session.teamId)
        render(view:"boughtPlayerTable", model: [ playerViewList:result ])
    }

    def getAvailablePlayers = {
        Integer clubId = Integer.valueOf(params.clubId)
        Integer classId = Integer.valueOf(params.classId)

        def result = playerViewService.findAllByClubIdAndClassIdNotInTeam(clubId, classId, session.teamId)
        render(view:"availablePlayerTable", model: [ playerViewList:result ])
    }

    def searchPlayer = {
        String searchString = params.searchString

        def result = PlayerView.search{
             fuzzy('name', searchString)
        }
        render(view:"availablePlayerTable", model: [ playerViewList:result.results ])
    }
}