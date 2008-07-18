import org.hibernate.SessionFactory
import org.hibernate.Query

/**
 * Service responsible for calling the stored procedures
 * to update player/team/league statistics
 */
class RatingStatService
 {
	SessionFactory sessionFactory

	def updateStatitics() {
		  //def sql = new groovy.sql.Sql(sessionFactory.currentSession.connection())  
	      sessionFactory.currentSession.createSQLQuery("call updatePlayerRatingStat()")   
	}
}