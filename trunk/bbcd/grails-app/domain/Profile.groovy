class Profile {
	static mapping = {
    	columns {
        	email column:'email', index:'email_Idx'
        }
    }

    static constraints = {
		firstName(blank:false)
		sirName(blank:false)
		email(blank:false, email:true, unique:true)
		password(blank:false)
    }

	String	firstName;
	String	sirName;
	String	email;
	String	password;
    Date 	lastLogin;
    int     activated;

    String toString() {
    	"${firstName} ${sirName}"
    }
}
