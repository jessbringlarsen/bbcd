import grails.converters.JSON

class TeamCreatorController {
    
    def index = { redirect(action:editTeam,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def editTeam = {
        def playerViewList = PlayerView.list()
        [playerViewList:PlayerView.list()]
    }

    def dataTableDataAsJSON = {
        def list = []
        def result = PlayerView.findById(params.id)
        response.setHeader("Cache-Control", "no-store")
        result.each {
            list << [
                    id: it.id,
                    name: it.name,
                    age: it.age,
            ]
        }
         def data = [
            totalRecords: list.size(),
            results: list
        ]
        render result as JSON
    }

     def allPlayers = {
        def list = []
        def result = PlayerView.list()
        response.setHeader("Cache-Control", "no-store")
        result.each {
            list << [
                    id: it.id,
                    name: it.name,
                    age: it.age,
            ]
        }
         def data = [
            totalRecords: list.size(),
            results: list
        ]
        render data as JSON
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
