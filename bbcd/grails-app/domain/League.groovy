class League {
	static mapping = {
    	columns {
        	email column:'name', index:'name_Idx'
        }
    }

	static constraints = {
		name(blank:false, unique:true)
		creationDate(blank:false)
		leagueAdministrator(blank:false)
    }
	
	static belongsTo = Tournament
	static hasMany = [teams:LeagueParticipant]
	
	String name;
	Date creationDate;
	Tournament tournament;  // The tournament the league belongs to.
	Boolean privateLeague;
	String password;
	Profile leagueAdministrator;
	
	public String toString() {
		return name
	}
}
