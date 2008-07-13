class Team {

	static mapping = {
    	columns {
        	email column:'name', index:'name_Idx'
        }
    }

	static constraints = {
		name(blank:false, unique:true)
		creationDate(blank:false)
		teamOwner(blank:false)
    }
	
	static belongsTo = LeagueParticipant
	static hasMany = [inleague:LeagueParticipant, players:Player]
	
	String name
    Integer credit
	Date creationDate
	Profile teamOwner
	
	public String toString() {
		return name
	}
}