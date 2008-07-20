

class BootStrap {

     def init = { servletContext ->

     	Profile profile = new Profile(firstName:"Jess", 
     			sirName:"Bring-Larsen",
     			email:"jess@bringlarsen.dk",
     			password:"hemmeligt",
     			activationKey:"1",
     			lastLogin:new Date(),
     			activated:new Integer(1),
     			question:"test",
     			answer:"test")
     	profile.save()
     	
     	new Team(name:"TeamOne",
     			credit:new Integer(500),
     			creationDate:new Date(),
     			teamOwner:profile).save()
     			
     	new Team(name:"TeamTwo",
     			credit:new Integer(1500),
     			creationDate:new Date(),
     			teamOwner:profile).save()
     	
     	Tournament tournament = new Tournament(name:"ØM",
     			tournamentStart:new Date(),
     			tournamentEnd: new Date(),
     			isCurrentTournament:Boolean.TRUE)
     	tournament.save()
     			
     	new League(name:"LeagueOne",
     			creationDate:new Date(),
		    	tournament:tournament,
		    	password:"hemmeligt",
		    	leagueAdministrator:profile).save()
		    	
		new League(name:"LeagueTwo",
     			creationDate:new Date(),
		    	tournament:tournament,
		    	password:"hemmeligt",
		    	leagueAdministrator:profile).save()
     	
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
