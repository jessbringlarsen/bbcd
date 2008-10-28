
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
	
	def IntegrationTestHelper() {
		new PointsRuleData()
		
		idraetsforbund = new Idraetsforbund(name: 'ØBTU', xmlId: '0001').save()
		new Idraetsforbund(name:"JBTU", xmlId:"0002").save()
     	new Idraetsforbund(name:"FBTU", xmlId:"0003").save()
     	new Idraetsforbund(name:"BBTU", xmlId:"0004").save()
		club = new Club(xmlId: '00001', name: 'BBC', shortName: 'BBC', union: idraetsforbund).save()

		createPlayers()
		
		ratingUpdates[0] = new RatingUpdate(dateOfUpdate: new Date(100, 1, 1)).save()
		ratingUpdates[1] = new RatingUpdate(dateOfUpdate: new Date(100, 1, 2)).save()
		
		
        profile = new Profile(username:"jebl",
                 userRealName:"Jess Bring-Larsen",
                 email:"jess@bringlarsen.dk",
                 passwd:"hemmeligt").save()

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
		new TeamPlayer(team:teams[0], player:players[0]).save()
     	new TeamPlayer(team:teams[0], player:players[1]).save()
		
     	new TeamPlayer(team:teams[1], player:players[2]).save()
     	new TeamPlayer(team:teams[1], player:players[3]).save()
     	
     	new TeamPlayer(team:teams[2], player:players[4]).save()
     	new TeamPlayer(team:teams[2], player:players[5]).save()
		
     	new TeamPlayer(team:teams[3], player:players[6]).save()
     	new TeamPlayer(team:teams[3], player:players[7]).save()
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
		new LeagueParticipant(league: leagues[0], team: teams[0]).save()
		new LeagueParticipant(league: leagues[0], team: teams[1]).save()
		new LeagueParticipant(league: leagues[1], team: teams[2]).save()
		new LeagueParticipant(league: leagues[1], team: teams[3]).save()
	}
}