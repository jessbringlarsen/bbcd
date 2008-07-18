class Rating implements Comparable {
	static belongsTo = [ratingUpdate:RatingUpdate, player:Player]

	static mapping = {
        columns {
            player column:'player_id', index:'rating_player_idx'
            ratingUpdate column:'rating_update_id', index:'rating_update_idx'
        }
    }
	
	static constraints = {
		ratingUpdate(unique:'player')
	}

	RatingUpdate ratingUpdate;
	int rating;
	Player player;
	Club club;

	String toString() {
		return "${player}: ${rating} at ${ratingUpdate}"
	}

	int compareTo(obj) {
		getRatingUpdate().compareTo(obj.getRatingUpdate())
	}

}
