class LeagueParticipant {

	static belongsTo = Team
	static constraints = {
		league(blank:false)
		team(blank:false)
		team(unique:'league')
    }
	
	League league
	Team team
	
	public String toString() {
		"${team}"
	}
}