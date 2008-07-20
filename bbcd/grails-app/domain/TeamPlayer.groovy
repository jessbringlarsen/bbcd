
/**
 * 
 * Define the coupling between a player an a team
 * 
 * @author jbl
 */
class TeamPlayer {

	static belongsTo = Team
	static constraints = {
		player(blank:false)
		team(blank:false)
		player(unique:'team')
    }
	static fetchMode = [player:'eager']
	
	Team team
	Player player
	
	String toString() {
		"${player}"
	}
}
