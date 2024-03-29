class TeamStat {

	static constraints = {
		team(blank:false)
		ratingUpdate(blank:false)
		ratingStatus(blank:false)
		creditStatus(blank:false)
		position(blank:false)
    }
	
	static belongsTo = [ratingUpdate:RatingUpdate]
	static mapping = {
    	columns {
    		team column:'team_id', index:'team_idx'
    		ratingUpdate column:'rating_update_id', index:'rating_update_idx, team_idx'
        }
    }

	RatingUpdate ratingUpdate
	Team team
	Integer ratingStatus
	Integer creditStatus
	Integer position 
}
