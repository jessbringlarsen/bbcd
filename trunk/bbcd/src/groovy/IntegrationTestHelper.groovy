
/**
 * Helper class for doing integration testing.
 * Responsible for setting up the needed domain objects
 */
class IntegrationTestHelper {
	
	static def idraetsforbund
	static def club
	static def players = []
	static def ratingUpdates = []
	
	static {
		new PointsRuleData()
		
		idraetsforbund = new Idraetsforbund(name: 'ØBTU', xmlId: '0001').save()
		new Idraetsforbund(name:"JBTU", xmlId:"0002").save()
     	new Idraetsforbund(name:"FBTU", xmlId:"0003").save()
     	new Idraetsforbund(name:"BBTU", xmlId:"0004").save()
		club = new Club(xmlId: '00001', name: 'BBC', shortName: 'BBC', union: idraetsforbund).save()
		
		players[0] = new Player(xmlId: '00001', 
				playerNo: '1',
				name: 'player1',
				gender: '1',
				dateOfBirth: new Date()).save()
		players[1] = new Player(xmlId: '00002', 
				playerNo: '2',
				name: 'player2',
				gender: '1',
				dateOfBirth: new Date()).save()
		players[2] = new Player(xmlId: '00003', 
				playerNo: '3',
				name: 'player3',
				gender: '1',
				dateOfBirth: new Date()).save()
				
		ratingUpdates[0] = new RatingUpdate(dateOfUpdate: new Date(100, 1, 1)).save()
		ratingUpdates[1] = new RatingUpdate(dateOfUpdate: new Date(100, 1, 2)).save()
	}
	
	def doRatingUpdate(def ratingUpdate, def rating, def player) {
        new Rating(ratingUpdate: ratingUpdate, rating: rating, player: player, club: club).save();
	}
}