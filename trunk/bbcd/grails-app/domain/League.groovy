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
	static hasMany = [teams:Team]
	
	static transients = [ "privateLeague" ] 
	
	String name;
	Date creationDate;
	Tournament tournament;  // The tournament the league belongs to.
	String password;
	Profile leagueAdministrator;
	
	boolean isPrivateLeague() {
		!password.isEmpty()
	}
	
	String toString() {
		return name
	}
}
