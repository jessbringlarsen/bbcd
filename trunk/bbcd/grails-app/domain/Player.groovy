import dk.brondbybordtennisclub.bbcd.domain.exceptions.PlayerDateParseException
import java.text.DateFormat
import java.text.ParseException

class Player {
	static mapping = {
    	columns {
    		xmlId column:'xml_id', index:'xml_id_idx'
    		playerNo column:'player_no', index:'player_no_idx'
        }
    }

	static hasMany = [ratings:Rating, teamParticipant:TeamPlayer]

	String		xmlId;
	String		playerNo;
	String		name;
	String		gender;
	Date		dateOfBirth;
	SortedSet	ratings;

	public String toString() {
		return getName()
	}

	/**
	 * <p>
	 * Given the personnr e.g. "300379-JBLR" extract the date and construct
	 * a date object.
	 * <p>
	 */
	Date parsePersonNr(String playerNo) throws PlayerDateParseException {
		Date returnValue = null;
		def playerDateOfBirth = playerNo =~ /^(\d{2})(\d{2})(\d{2})-.+$/

		if(playerDateOfBirth.matches()) {
			DateHolder dateHolder = new DateHolder(playerDateOfBirth[0][3], playerDateOfBirth[0][2], playerDateOfBirth[0][1]);

			// Is the date valid
			GregorianCalendar gc = new GregorianCalendar();
			gc.setLenient(false);
            gc.set(GregorianCalendar.YEAR, dateHolder.getLongYear())
            gc.set(GregorianCalendar.MONTH, (dateHolder.getMonth()-1))
            gc.set(GregorianCalendar.DATE, dateHolder.getDay())
			try {
	            returnValue = gc.getTime()
			} catch (IllegalArgumentException e) {
				throw new PlayerDateParseException("Could not parse: " + playerNo)
			}
		} else {
			throw new PlayerDateParseException("Could not parse: " + playerNo)
		}
		return returnValue
	}
}

/**
 * Responsible for holding a date of the format:
 * 79-03-30 (YY-MM-DD)
 */
 class DateHolder {
	String shortYearString
	int shortYear, month, day

	DateHolder(String shortYear, String month, String day) {
		this.shortYearString = shortYear
		this.shortYear = Integer.parseInt(shortYear).intValue()
		this.month =  Integer.parseInt(month).intValue()
		this.day = Integer.parseInt(day).intValue()
	}

	/**
	 * <p>
	 * Given a short year string, e.g. 79 prefix with either 19 or 20
	 * </p>
	 * <p>
	 * As we only have e.g. 79 as year indicator we assume that if the player year is greater
	 * that current year 79 < 08 (2008) we assume the date of birth is 1979.
	 * If player year is less than current year e.g. 04 < 08 assume 2004
	 * </p>
	 */
	int getLongYear() {
		Calendar calendar = new GregorianCalendar()
		String currentYear = calendar.get(Calendar.YEAR)
		Integer currentYearPre = Integer.parseInt(currentYear.substring(0, 2))	// 20
		Integer currentYearPost = Integer.parseInt(currentYear.substring(2, 4))	// 08

		String playerYearString;

		// Prefix year with 19 or 20
		if(shortYear <= currentYearPost) {
			playerYearString = "${currentYearPre}${shortYearString}"
		} else {
			playerYearString = "${(currentYearPre-1)}${shortYearString}"
		}
		return Integer.parseInt(playerYearString).intValue()
	}
}
