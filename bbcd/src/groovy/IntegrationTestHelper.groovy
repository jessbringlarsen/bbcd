
/**
 * Helper class for doing integration testing.
 * Responsible for setting up the needed basic test data
 */
class IntegrationTestHelper {
	
	def profile 
	def idraetsforbund
	def club
	def players = []
	def ratingUpdates = []
	def teams = []
	def leagues = []
	private static IntegrationTestHelper instance;

    public static synchronized IntegrationTestHelper getInstance() {
        if(instance != null) {
            return instance;
        }
        instance = new IntegrationTestHelper();
        return instance;
    }

	private IntegrationTestHelper() {
		new PointsRuleData()
		
		idraetsforbund = new Idraetsforbund(name: 'ØBTU', xmlId: '0001').save()
		new Idraetsforbund(name:"JBTU", xmlId:"0002").save()
     	new Idraetsforbund(name:"FBTU", xmlId:"0003").save()
     	new Idraetsforbund(name:"BBTU", xmlId:"0004").save()
		club = new Club(xmlId: '00001', name: 'BBC', shortName: 'BBC', union: idraetsforbund).save()
		
		ratingUpdates[0] = new RatingUpdate(dateOfUpdate: new Date(100, 1, 1)).save()
		ratingUpdates[1] = new RatingUpdate(dateOfUpdate: new Date(100, 1, 2)).save()
		
		
        profile = new Profile(username:"jebl",
                 userRealName:"Jess Bring-Larsen",
                 email:"jess@bringlarsen.dk",
                 passwd:"hemmeligt").save()


		createPlayers()
		createTeams()
     	createTeamPlayers()
     	createLeagues()
		createLeagueParticipants()    	
		
	}
	
	def doRatingUpdate(def ratingUpdate, def rating, def player) {
        new Rating(ratingUpdate: ratingUpdate, rating: rating, player: player, club: club).save();
	}
	
	private def createPlayers() {
		for(i in 0..7) {
			players[i] = new Player(xmlId: "0000${i}", 
                playerNo: "${i}",
                name: "player-${i}",
                gender: '1',
                dateOfBirth: new Date()).save()
		}
	}
	
	private def createTeams() {
		for(i in 0..3) {
			teams[i] = new Team(name:"Team-${i}",
	     			credit:new Integer(1500),
	     			creationDate:new Date(),
	     			teamOwner:profile).save()
		}
	}
	
	private def createTeamPlayers() {
		teams[0].addToPlayers(players[0])
     	teams[0].addToPlayers(players[1])
		
     	teams[1].addToPlayers(players[2])
     	teams[1].addToPlayers(players[3])
     	
     	teams[2].addToPlayers(players[4])
     	teams[2].addToPlayers(players[5])
		
     	teams[3].addToPlayers(players[6])
     	teams[3].addToPlayers(players[7])
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