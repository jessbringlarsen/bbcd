import org.hibernate.SessionFactory
import org.hibernate.Query

/**
 * Service responsible for calling the stored procedures
 * to update player/team/league statistics
 */
class RatingStatService
 {
	SessionFactory sessionFactory
	
	def updatePlayerStatitics() {
		callStoredProcedure("call updatePlayerRatingStat()")
	}
	
	def updateTeamStatitics() {
		callStoredProcedure("call updateTeamRatingStat()")
	}
	
	def updateLeagueStatitics() {
		callStoredProcedure("call updateLeagueRatingStat()")
	}
	
	private def callStoredProcedure(String procedure) {
	      def sql = new groovy.sql.Sql(sessionFactory.currentSession.connection())  
	      def row = sql.execute(procedure)
	}
}