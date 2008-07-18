
/**
 * Responsible for setting test data
 */
class RatingUpdateTest  extends GroovyTestCase {
	
	public void testRatingUpdateProcedures() {
		def idraetsforbund = new Idraetsforbund(name: 'ØBTU', xmlId: '0001').save()
		def club = new Club(xmlId: '00001', name: 'BBC', shortName: 'BBC', union: idraetsforbund).save()
		def players = []
		def ratingUpdate = []
		
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
		players[3] = new Player(xmlId: '00003', 
				playerNo: '3',
				name: 'player3',
				gender: '1',
				dateOfBirth: new Date()).save()
				
		ratingUpdate[0] = new RatingUpdate(dateOfUpdate: new Date(100, 1, 1)).save()
		new Rating(ratingUpdate: ratingUpdate[0], rating: 1000, player: players[0], club: club).save();
		new Rating(ratingUpdate: ratingUpdate[0], rating: 1500, player: players[1], club: club).save();
		new Rating(ratingUpdate: ratingUpdate[0], rating: 1500, player: players[2], club: club).save();
		
		def ratingList = Rating.list()
		assert players[0].ratings.size() == 1
		
		ratingUpdate[1] = new RatingUpdate(dateOfUpdate: new Date(100, 1, 2)).save()
		new Rating(ratingUpdate: ratingUpdate[1], rating: 1500, player: players[0], club: club).save();
		new Rating(ratingUpdate: ratingUpdate[1], rating: 1, player: players[1], club: club).save();
		new Rating(ratingUpdate: ratingUpdate[1], rating: 900, player: players[2], club: club).save();
		
		ratingList = Rating.list()
		assert players[0].ratings.size() == 2
		
		ratingUpdate[2] = new RatingUpdate(dateOfUpdate: new Date(100, 1, 3)).save()
		new Rating(ratingUpdate: ratingUpdate[2], rating: 1500, player: players[0], club: club).save();
		new Rating(ratingUpdate: ratingUpdate[2], rating: 3000, player: players[1], club: club).save();
		new Rating(ratingUpdate: ratingUpdate[2], rating: 800, player: players[2], club: club).save();
		
		ratingList = Rating.list()
		assert players[0].ratings.size() == 3
	}
}