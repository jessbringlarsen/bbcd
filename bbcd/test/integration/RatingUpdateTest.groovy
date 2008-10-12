
/**
 * Test the stored procedure that update player statistics
 */
class RatingUpdateTest  extends GroovyTestCase {

	 def RatingStatService ratingStatService
	 def integrationTestHelper
	 
	 def firstUpdateRatings =  [1000, 500, 1500, 10, 0, 300, 1563, 4568]
	 def secondUpdateRatings = [1000, 0, 2000, 11, 100, 1500, 1560, 4570]
	 
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
	    
	    // Check that the players have updated their rating properly
	    checkPlayersStats()

		// Call stored procedure that update team_stat
	    ratingStatService.updateTeamStatitics()
	    
	    // Check team rating and their position
	    def teamRatings = [[-500, 4], [501, 2], [1300, 1], [-1, 3]]
	    for(i in 0..3) {
	    	checkTeam(integrationTestHelper.teams[i], teamRatings[i][0], teamRatings[i][1])
	    }
		
		// Call stored procedure that update league_stat
	    ratingStatService.updateLeagueStatitics()
	    LeagueStat leagueStatOne = LeagueStat.findByLeague(integrationTestHelper.leagues[0])
	    assert leagueStatOne.getPosition() == 2
	    LeagueStat leagueStatTwo = LeagueStat.findByLeague(integrationTestHelper.leagues[1])
	    assert leagueStatTwo.getPosition() == 1
	}
	 
	 /**
	  * Check that the playerStat table have been updated properly
	  */
	 private def checkPlayersStats() {
		 
		 def playerRatings = computePlayerRatingDiff()
		 for(int i=0; i<firstUpdateRatings.size(); i++) {
			def player = integrationTestHelper.players[i] 
			def expectedRating = playerRatings[i]
		 
			def playerStats = PlayerStat.findAllByPlayer(player)
			assert playerStats.size() == 1
			assert playerStats[0].ratingStatus == expectedRating
			 
			def pointsRule = PointsRule.findByFromRatingLessThanEqualsAndToRatingGreaterThanEquals(expectedRating, expectedRating)
			assert playerStats[0].creditStatus == pointsRule.credit
		 }
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
		 
		 for(int i=0; i<firstUpdateRatings.size(); i++) {
			 integrationTestHelper.doRatingUpdate(ratingUpdate, firstUpdateRatings[i], integrationTestHelper.players[i])
		 }
	 }
	 
	 private def doSecondRatingUpdate() {
		 def ratingUpdate = integrationTestHelper.ratingUpdates[1]
		 
		 for(int i=0; i<firstUpdateRatings.size(); i++) {
			 integrationTestHelper.doRatingUpdate(ratingUpdate, secondUpdateRatings[i], integrationTestHelper.players[i])
		 }
	 }
	 
	 /**
	  * Compute the difference in player rating between the first and second
	  * rating update
	  */
	 private def computePlayerRatingDiff() {
		 def ratingDif = []
		 
		 for(int i=0; i<firstUpdateRatings.size(); i++) {
			 ratingDif[i] = secondUpdateRatings[i] - firstUpdateRatings[i]
		 }
		 return ratingDif
	 }
	 
	 /**
	  * Compute the rating difference from the first to second 
	  * rating update
	  */
	 private def computeTeamRatingDiff() {
		 
		 int j=1;
		 for(int i=0; i<firstUpdateRatings.size()-1; i=i+2) {
		     println "${firstUpdateRatings[i]} ${firstUpdateRatings[j]}"
		     j=j+2
		 }
		 
		 def teamRatings = [[-500, 4], [501, 2], [1300, 1], [-1, 3]]
	 }
}