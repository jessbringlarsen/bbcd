/**
 * Statistics for a player in a single tournament
 */
class PlayerStatTournament {

     static constraints = {
		tournament(unique: 'player')
		player(blank: false)
	}

    Tournament tournament
    Player player
    Integer noOfTimesBought
    Integer noOfTimesSold
}
