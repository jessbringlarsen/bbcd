/**
 * Represent a tournament for e.g. the season 2005-2006
 */
class Tournament {
	 static mapping = {
    	columns {
        	name column:'name', index:'name_Idx'
        }
	 }

	 static constraints = {
		name(blank:false, unique:true)
		tournamentStart(blank:false)
		tournamentEnd(blank:false)
	 }
	 
	 
	String name
    Date tournamentStart
    Date tournamentEnd
    Boolean isCurrentTournament

    public String toString() {
		 return name
	 }
}