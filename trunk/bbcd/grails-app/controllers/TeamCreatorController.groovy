import grails.converters.JSON

class TeamCreatorController {
    def playerViewService
    
    def index = { redirect(action:editTeam,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def editTeam = {
        def playerViewList = PlayerView.list()
        [playerViewList:playerViewList, clubList:Club.list()]
    }

    def addPlayerToTeam = {
        def team = Team.get(1)
        def playerToAdd = Player.findById(params.id)
        team.addToPlayers(playerToAdd)

        def result = playerViewService.getByTeam(1)
        render(view:"boughtPlayerTable", model: [ playerViewList:result ])
    }

     def removePlayerFromTeam = {
        def team = Team.get(1)
        def playerToAdd = Player.findById(params.id)
        team.removeFromPlayers(playerToAdd)

        def result = playerViewService.getByTeam(1)
        render(view:"boughtPlayerTable", model: [ playerViewList:result ])
    }

    def getTeamPlayers = {
        def result = playerViewService.getByTeam(1)
        render(view:"boughtPlayerTable", model: [ playerViewList:result ])
    }

    def getAvailablePlayers = {
        Integer clubId = Integer.valueOf(params.clubId)
        Integer classId = Integer.valueOf(params.classId)

        def result = playerViewService.findAllByClubIdAndClassIdNotInTeam(clubId, classId, 1L)
        render(view:"availablePlayerTable", model: [ playerViewList:result ])
    }


   /* def teamCreateFlow = {
       teamName {
           on("getTeamName") {
            flow.name = params.teamName
           }.to "editTeam"
           on("cancel").to "displayCatalogue"
       }
       
       editTeam {
           on("buyPlayer").to "editTeam"
           on("done").to "displayTeam"
       }
   }*/

}
