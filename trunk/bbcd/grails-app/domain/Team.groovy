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
	
	static hasMany = [inleague:LeagueParticipant, players:Player]
	static belongsTo = Player

	String name
    Integer credit
	Date creationDate
	Profile teamOwner
	
	public String toString() {
		return name
	}
}