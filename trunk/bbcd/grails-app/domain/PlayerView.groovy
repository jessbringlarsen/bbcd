import dk.brondbybordtennisclub.bbcd.domain.exceptions.PlayerDateParseException
import java.text.DateFormat
import java.text.ParseException

/**
 * Domain class based on a view to present the latest info
 * about players.
 *
 */
class PlayerView {

	String	dateOfBirth;
	String	gender;
	String	name;
	String  rating;
    Integer price;
    String  clubName;
    String  clubNameShort;
    Integer noOfTimesBought;
    Integer noOfTimesSold;
}