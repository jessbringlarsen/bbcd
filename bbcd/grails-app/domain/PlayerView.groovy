/**
 * Domain class based on a view to present the latest info
 * about players.
 *
 * This domainclass is based on view.
 *
 */
class PlayerView {
    // Make domain class searchable (searchable plugin)
    static searchable = true

    String  dateOfBirth;
	String	gender;
	String	name;
    Integer age;
	String  rating;
    String  className;
    Integer price;
    String  clubName;
    Integer noOfTimesBought;
    Integer noOfTimesSold;
}