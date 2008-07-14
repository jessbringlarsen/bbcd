class LeagueParticipant {

	static belongsTo = League
	static constraints = {
		league(blank:false)
		team(blank:false)
		team(unique:'league')
    }
	static mapping = {
    	columns {
    		league index:'league_id_idx'
    		team  index:'team_id_idx'
        }
    }

	
	League league
	Team team
	
	public String toString() {
		"${team}"
	}
}