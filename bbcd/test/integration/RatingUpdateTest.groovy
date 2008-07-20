
/**
 * Test the stored procedure that update player statistics
 */
class RatingUpdateTest  extends GroovyTestCase {

	 def RatingStatService ratingStatService
	 def integrationTestHelper = new IntegrationTestHelper()
	 
	 public void testRatingUpdateProcedures() {
		
		doFirstRatingUpdate()
		def ratingList = Rating.findAllByPlayer(IntegrationTestHelper.players[0])
		assert ratingList.size() == 1

		doSecondRatingUpdate()
		ratingList = Rating.findAllByPlayer(IntegrationTestHelper.players[0])
		assert ratingList.size() == 2
		
		// Call stored procedure that update player_stat
	    ratingStatService.updatePlayerStatitics()
	    
	    checkPlayer(IntegrationTestHelper.players[0], 0)
	    checkPlayer(IntegrationTestHelper.players[1], -500)
	    checkPlayer(IntegrationTestHelper.players[2], 500)
	}
	 
	 /**
	  * Check that the playerStat table have been updated properly
	  */
	 private def checkPlayer(def player, def expectedRating) {
		 def playerStats = PlayerStat.findAllByPlayer(player)
		 assert playerStats.size() == 1
		 assert playerStats[0].ratingStatus == expectedRating
		 def pointsRule = PointsRule.findByFromRatingLessThanEqualsAndToRatingGreaterThanEquals(expectedRating, expectedRating)
		 assert playerStats[0].creditStatus == pointsRule.credit
	 }
	 
	 private def doFirstRatingUpdate() {
		 def ratingUpdate = integrationTestHelper.ratingUpdates[0]
		 integrationTestHelper.doRatingUpdate(ratingUpdate, 1000, integrationTestHelper.players[0])
		 integrationTestHelper.doRatingUpdate(ratingUpdate, 500, integrationTestHelper.players[1])
		 integrationTestHelper.doRatingUpdate(ratingUpdate, 1500, integrationTestHelper.players[2])
	 }
	 
	 private def doSecondRatingUpdate() {
		 def ratingUpdate = integrationTestHelper.ratingUpdates[1]
		 integrationTestHelper.doRatingUpdate(ratingUpdate, 1000, integrationTestHelper.players[0])
		 integrationTestHelper.doRatingUpdate(ratingUpdate, 0, integrationTestHelper.players[1])
		 integrationTestHelper.doRatingUpdate(ratingUpdate, 2000, integrationTestHelper.players[2])
	 }
}