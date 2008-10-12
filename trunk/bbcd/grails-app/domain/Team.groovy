class Team {

	static mapping = {
    	columns {
        	name column:'name', index:'name_Idx'
        }
    }

	static constraints = {
		name(blank:false, unique:true)
		creationDate(blank:false)
		teamOwner(blank:false)
    }
	
	static hasMany = [inleague:LeagueParticipant, players:TeamPlayer]
	
	String name
    Integer credit
	Date creationDate
	Profile teamOwner
	
	public String toString() {
		return name
	}
}