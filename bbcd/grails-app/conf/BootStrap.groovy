import org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes
import org.springframework.context.*

class BootStrap {

     def init = { servletContext ->
        ApplicationContext ctx = servletContext.getAttribute(GrailsApplicationAttributes.APPLICATION_CONTEXT)
        RatingStatService ratingService = (RatingStatService) ctx.getBean("ratingStatService")

		IntegrationTestHelper integrationTestHelper = IntegrationTestHelper.getInstance();
				
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

        // Index PlayerView so it can be retrieved via the SearchablePlugin
        PlayerView.index()
        //SearchableService searchableService = (SearchableService) ctx.getBean("searchableService")
        //searchableService.rebuildSpellingSuggestions(fork: true)
     }

     def destroy = {
     }
}
