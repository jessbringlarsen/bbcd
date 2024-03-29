
class PlayerStat {
	static belongsTo = [ratingUpdate:RatingUpdate]
	static mapping = {
    	columns {
    		player column:'player_id', index:'player_idx'
    		ratingUpdate column:'rating_update_id', index:'rating_update_idx, player_idx'
        }
    }

	Player player
	RatingUpdate ratingUpdate

	// 'Angiver spillerens frem- eller tilbage-gang siden sidste ratingopdatering',
	Integer ratingStatus

	// 'Angiver spillerens frem-eller tilbage-gang i pris siden sidste ratingopdatering',
	Integer creditStatus
}