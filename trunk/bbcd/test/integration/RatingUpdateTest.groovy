
/**
 * Test the stored procedure that update player statistics
 */
class RatingUpdateTest  extends GroovyTestCase {

	 def RatingStatService ratingStatService
	 def integrationTestHelper
	 
	 public void testRatingUpdateProcedures() {
		integrationTestHelper = new IntegrationTestHelper()
		 
		doFirstRatingUpdate()
		def ratingList = Rating.findAllByPlayer(integrationTestHelper.players[0])
		assert ratingList.size() == 1

		doSecondRatingUpdate()
		ratingList = Rating.findAllByPlayer(integrationTestHelper.players[0])
		assert ratingList.size() == 2
		
		// Call stored procedure that update player_stat
	    ratingStatService.updatePlayerStatitics()
	    
	    // Check player rating after update 
	    def playerRatings = [0, -500, 500, 1, 100, 1200, -3, 2]
	    for(i in 0..7) {
	    	checkPlayer(integrationTestHelper.players[i], playerRatings[i])
	    }
	    ratingStatService.updateTeamStatitics()
	    
	    // Check team rating and their position
	    def teamRatings = [[-500, 4], [501, 2], [1300, 1], [-1, 3]]
	    for(i in 0..3) {
	    	checkTeam(integrationTestHelper.teams[i], teamRatings[i][0], teamRatings[i][1])
	    }
	    ratingStatService.updateLeagueStatitics()
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
		 TeamPlayer.findAllByTeam(team).each { teamPlayer -> 
		 	def playerStat = PlayerStat.findByPlayer(teamPlayer.player)
		 	def pointsRule = PointsRule.findByFromRatingLessThanEqualsAndToRatingGreaterThanEquals(playerStat.ratingStatus, playerStat.ratingStatus)
		 	creditStatus += pointsRule.credit
		 }
		 assert teamStat.creditStatus == creditStatus
		     
	 }
	 
	 private def doFirstRatingUpdate() {
		 def ratingUpdate = integrationTestHelper.ratingUpdates[0]
		 def ratings = [1000, 500, 1500, 10, 0, 300, 1563, 4568]
		 
		 for(i in 0..7) {
			 integrationTestHelper.doRatingUpdate(ratingUpdate, ratings[i], integrationTestHelper.players[i])
		 }
	 }
	 
	 private def doSecondRatingUpdate() {
		 def ratingUpdate = integrationTestHelper.ratingUpdates[1]
		 def ratings = [1000, 0, 2000, 11, 100, 1500, 1560, 4570]
		 
		 for(i in 0..7) {
			 integrationTestHelper.doRatingUpdate(ratingUpdate, ratings[i], integrationTestHelper.players[i])
		 }
	 }
}