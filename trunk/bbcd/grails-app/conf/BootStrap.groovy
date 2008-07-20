

class BootStrap {

     def init = { servletContext ->

     	new PointsRuleData()
     	
		IntegrationTestHelper integrationTestHelper = new IntegrationTestHelper() 
				
     	def ratingUpdate = integrationTestHelper.ratingUpdates[0]
		integrationTestHelper.doRatingUpdate(ratingUpdate, 1000, integrationTestHelper.players[0])
		integrationTestHelper.doRatingUpdate(ratingUpdate, 500, integrationTestHelper.players[1])
		integrationTestHelper.doRatingUpdate(ratingUpdate, 1500, integrationTestHelper.players[2])

		ratingUpdate = integrationTestHelper.ratingUpdates[1]
		integrationTestHelper.doRatingUpdate(ratingUpdate, 1000, integrationTestHelper.players[0])
		integrationTestHelper.doRatingUpdate(ratingUpdate, 0, integrationTestHelper.players[1])
		integrationTestHelper.doRatingUpdate(ratingUpdate, 2000, integrationTestHelper.players[2])
     }

     def destroy = {
     }
}
