import org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes
import org.springframework.context.*

class BootStrap {

     def init = { servletContext ->
        ApplicationContext ctx = servletContext.getAttribute(GrailsApplicationAttributes.APPLICATION_CONTEXT)
        RatingStatService ratingService = (RatingStatService) ctx.getBean("ratingStatService")
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

        ratingService.updatePlayerStatitics()
        ratingService.updateTeamStatitics()
        ratingService.updateLeagueStatitics()

		
		// Create default rule defined in SecurityConfig
		Role roleUser = new Role(authority:"ROLE_USER", description:"Default user role").save()
		Role roleAdmin = new Role(authority:"ROLE_ADMIN", description:"Administrator").save()
		
		// Create admin user: admin, password: admin
		Profile admin = new Profile(username:"admin", 
                passwd:"21232f297a57a5a743894a0e4a801fc3", 
                userRealName: "admin",
                email: "admin",
                enabled: true)
                .addToAuthorities(roleAdmin)
                .addToAuthorities(roleUser).save()
     }

     def destroy = {
     }
}
