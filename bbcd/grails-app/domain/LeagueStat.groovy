class LeagueStat {
	static constraints = {
		league(blank:false)
		ratingUpdate(blank:false)
		ratingStatus(blank:false)
		creditStatus(blank:false)
		position(blank:false)
    }
	
	static belongsTo = [ratingUpdate:RatingUpdate]
	static mapping = {
    	columns {
    		league column:'league_id', index:'league_idx'
    		ratingUpdate column:'rating_update_id', index:'rating_update_idx, league_idx'
        }
    }

	RatingUpdate ratingUpdate
	League league
	Integer ratingStatus
	Integer creditStatus
	Integer position 
}