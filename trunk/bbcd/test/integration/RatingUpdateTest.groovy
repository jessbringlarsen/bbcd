
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
	    checkPlayer(IntegrationTestHelper.players[3], 1)
	    
	    ratingStatService.updateTeamStatitics()
	    
	    checkTeam(IntegrationTestHelper.teams[0], -500, 2)
	    checkTeam(IntegrationTestHelper.teams[1], 501, 1)
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
	 
	 /**
	  * Check that the teamStat table have been updated properly
	  */
	 private def checkTeam(Team teamObj, def expectedRating, def expectedPosition) {
		 // Check the rating
		 def team = Team.get(teamObj.id)
		 def teamStat = TeamStat.findByTeam(team)
		 assert teamStat.ratingStatus == expectedRating
		 assert teamStat.position == expectedPosition
		  
		 // Check the credit of the team (credit sum of all players on team)
		 int creditStatus = 0
		 team.players.each { teamPlayer -> 
		 	def playerStat = PlayerStat.findByPlayer(teamPlayer.player)
		 	def pointsRule = PointsRule.findByFromRatingLessThanEqualsAndToRatingGreaterThanEquals(playerStat.ratingStatus, playerStat.ratingStatus)
		 	creditStatus += pointsRule.credit
		 }
		 assert teamStat.creditStatus == creditStatus
		     
	 }
	 
	 private def doFirstRatingUpdate() {
		 def ratingUpdate = integrationTestHelper.ratingUpdates[0]
		 integrationTestHelper.doRatingUpdate(ratingUpdate, 1000, integrationTestHelper.players[0])
		 integrationTestHelper.doRatingUpdate(ratingUpdate, 500, integrationTestHelper.players[1])
		 integrationTestHelper.doRatingUpdate(ratingUpdate, 1500, integrationTestHelper.players[2])
		  integrationTestHelper.doRatingUpdate(ratingUpdate, 10, integrationTestHelper.players[3])
	 }
	 
	 private def doSecondRatingUpdate() {
		 def ratingUpdate = integrationTestHelper.ratingUpdates[1]
		 integrationTestHelper.doRatingUpdate(ratingUpdate, 1000, integrationTestHelper.players[0])
		 integrationTestHelper.doRatingUpdate(ratingUpdate, 0, integrationTestHelper.players[1])
		 integrationTestHelper.doRatingUpdate(ratingUpdate, 2000, integrationTestHelper.players[2])
		 integrationTestHelper.doRatingUpdate(ratingUpdate, 11, integrationTestHelper.players[3])
	 }
}