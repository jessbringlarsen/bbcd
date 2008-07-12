
/**
 * 
 * Service for retriving players.
 * 
 * @author jbl
 */
class PlayerService {

	/**
	 * @return list of players member of the specified club on the time of the
	 *  latest ratingupdate
	 */
	def getByClub(Club club) {
		return getByClub(club.id)
	}

	/**
	 * @see getByClub(Club club)
	 */
	def getByClub(String clubId) {
        return getByClub(new Long(clubId))
    }

	/**
	 * @see getByClub(Club club)
	 */
	def getByClub(long clubId) {
		return Player.executeQuery("""\
				select r.player \
				from Rating as r \
				where r.ratingUpdate.id = (select id from RatingUpdateH) \
				and r.club.id = ? \
				order by r.player.name""", [clubId])
	}

	/**
	 * Search for players with a given name and club
	 *  
	 */
	def getByClub(long clubId, String playerNo) {
        return Player.executeQuery("""\
                select r.player \
                from Rating as r \
                where r.ratingUpdate.id = (select id from RatingUpdateH) \
                and r.club.id = ? \
                and r.player.playerNo like ?
                order by r.player.name""", [clubId, playerNo])
    }
	
	/**
	 * @return list of players, members of a club and not already 
	 * member of a playerExternalBinding association
	 */
	 def getByClubMinusPlayerExternalBinding(Long clubId) {
		 return Player.executeQuery("""\
	                select r.player \
	                from Rating as r \
	                where r.ratingUpdate.id = (select id from RatingUpdateH) \
	                and r.player not in (select player from PlayerExternalBinding) \
	                and r.club.id = ? \
	                order by r.player.name""", [clubId])
	}
	
	 def getByClubMinusPlayerExternalBinding(String clubId) {
		 return this.getByClubMinusPlayerExternalBinding(new Long(clubId))
	 }
}