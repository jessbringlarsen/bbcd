import java.text.DateFormat;

class RatingUpdate implements Comparable {
	static hasMany = [playerStats:PlayerStat, ratings:Rating]
	static mapping = {
    	columns {
    		dateOfUpdate column:'date_of_update', index:'date_of_update_idx'
        }
    }
	static constraints = {
		dateOfUpdate(blank: false, unique: true)
	}
	

	static DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.SHORT)

	Date dateOfUpdate;
    //Tournament tournament;

    public String toString() {
    	return dateFormat.format(dateOfUpdate)
    }

    int compareTo(obj) {
        getDateOfUpdate().compareTo(obj.getDateOfUpdate())
    }
}
