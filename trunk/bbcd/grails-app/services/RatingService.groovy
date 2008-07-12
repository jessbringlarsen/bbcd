import org.hibernate.SessionFactory
import org.hibernate.Query

/**
 * Service responsible for retrieving ratingdata as needed
 */
class RatingService
 {
	SessionFactory sessionFactory

	def grailsApplication
    def setting

    /**
     * Given a player id return an array [rating, date] sorted by date
     */
	def getRatingData(Integer playerId) {
		def session = sessionFactory.getCurrentSession()

		Query query = session.createSQLQuery("""
			select ra.rating, DATE_FORMAT(ru.date_of_update, GET_FORMAT(DATE,'EUR'))
			from rating ra
			join rating_update ru on ru.id = ra.rating_update_id
			where ra.player_id = ?
			order by date_of_update asc;""")
		return query.setString(0, playerId.toString()).list()
	}

}