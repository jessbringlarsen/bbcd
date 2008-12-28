
/**
 * Helper class for doing integration testing.
 * Responsible for setting up the needed basic test data
 */
class IntegrationTestHelper {
	
	private def profile
	private def idraetsforbund
	private def club = []
	private def players = []
	private def ratingUpdates = []
	private def teams = []
	private def leagues = []
	private static final IntegrationTestHelper instance = new IntegrationTestHelper()

    static IntegrationTestHelper getInstance() {
        return instance;
    }

	private IntegrationTestHelper() {
		new PointsRuleData()
        BootStrapData.loadLicenseClassData()
		
		idraetsforbund = new Idraetsforbund(name: 'ØBTU', xmlId: '0001').save()
		new Idraetsforbund(name:"JBTU", xmlId:"0002").save()
     	new Idraetsforbund(name:"FBTU", xmlId:"0003").save()
     	new Idraetsforbund(name:"BBTU", xmlId:"0004").save()
		club[0] = new Club(xmlId: '00001', name: 'BBC', shortName: 'BBC', union: idraetsforbund).save()
        club[1] = new Club(xmlId: '00002', name: 'BBC-2', shortName: 'BBC-2', union: idraetsforbund).save()
		
		ratingUpdates[0] = new RatingUpdate(dateOfUpdate: new Date(100, 1, 1)).save()
		ratingUpdates[1] = new RatingUpdate(dateOfUpdate: new Date(100, 1, 2)).save()
		
		
        profile = new Profile(username:"jebl",
                 userRealName:"Jess Bring-Larsen",
                 email:"jess@bringlarsen.dk",
                 passwd:"hemmeligt").save()


		createPlayers()
		createTeams()
     	createLeagues()
		createLeagueParticipants()    	
		
	}
	
	def doRatingUpdate(def ratingUpdate, def rating, def player, def club) {
        new Rating(ratingUpdate: ratingUpdate, rating: rating, player: player, club: club).save();
	}
	
	private def createPlayers() {
        def firstNames = ["Henrik", "Ole", "Peter", "Hans", "Signe", "Olaf", "Søren", "Line"]
        def lastNames = ["Hansen", "Jensen", "Singtved Ottesen", "Clausen", "Tonnesen", "Skælbæk", "Jensen", "Tavborg Jensen"]
        
		for(i in 0..7) {
			players[i] = new Player(xmlId: "0000${i}", 
                playerNo: "${i}",
                name: "${firstNames[i]} ${lastNames[i]}",
                gender: '1',
                dateOfBirth: new Date()).save()
                doRatingUpdate(ratingUpdates[0], 500, players[i], club[0])
                doRatingUpdate(ratingUpdates[1], 1000, players[i], club[0])
		}

        for(i in 8..15) {
			players[i] = new Player(xmlId: "0000${i}",
                playerNo: "${i}",
                name: "${firstNames[i-8]} ${lastNames[i-8]}",
                gender: '0',
                dateOfBirth: new Date()).save()
                doRatingUpdate(ratingUpdates[0], 600, players[i], club[1])
                doRatingUpdate(ratingUpdates[1], 625, players[i], club[1])
		}

       /*
        def ratingUpdate = integrationTestHelper.ratingUpdates[0]
		integrationTestHelper.doRatingUpdate(ratingUpdate, 1000, integrationTestHelper.players[0])
		integrationTestHelper.doRatingUpdate(ratingUpdate, 500, integrationTestHelper.players[1])
		integrationTestHelper.doRatingUpdate(ratingUpdate, 1500, integrationTestHelper.players[2])

		ratingUpdate = integrationTestHelper.ratingUpdates[1]
		integrationTestHelper.doRatingUpdate(ratingUpdate, 1000, integrationTestHelper.players[0])
		integrationTestHelper.doRatingUpdate(ratingUpdate, 0, integrationTestHelper.players[1])
		integrationTestHelper.doRatingUpdate(ratingUpdate, 2000, integrationTestHelper.players[2])*/
	}

    Integer getTotalNumberOfPlayers() {
        return players.size()
    }

	private def createTeams() {
        // Create teams
        def playerIndex = 0
        def noOfTeams = (getTotalNumberOfPlayers()/2)-1
        
        for(teamIndex in 0..noOfTeams) {
            teams[teamIndex] = new Team(name:"Team-${teamIndex}",
	     			credit:new Integer(1500),
	     			creationDate:new Date(),
	     			teamOwner:profile).save()

            // Add players
            teams[teamIndex].addToPlayers(players[playerIndex++])
            teams[teamIndex].addToPlayers(players[playerIndex++])
        }
	}

   Integer getTotalNumberOfTeams() {
       return teams.size()
   }
	
	private def createLeagues() { 
		Tournament tournament = new Tournament(name:"ØM",
     			tournamentStart:new Date(),
     			tournamentEnd: new Date(),
     			isCurrentTournament:Boolean.TRUE)
     	tournament.save()
     			
     	leagues[0] = new League(name:"LeagueOne",
     			creationDate:new Date(),
		    	tournament:tournament,
		    	password:"hemmeligt",
		    	leagueAdministrator:profile).save()
		    	
		leagues[1] = new League(name:"LeagueTwo",
     			creationDate:new Date(),
		    	tournament:tournament,
		    	password:"hemmeligt",
		    	leagueAdministrator:profile).save()
	}
	
	private def createLeagueParticipants() {
		leagues[0].addToTeams(teams[0])
		leagues[0].addToTeams(teams[1])
		leagues[1].addToTeams(teams[2])
		leagues[1].addToTeams(teams[3])
	}
}