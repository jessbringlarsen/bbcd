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
    String  activationKey;
    Date 	lastLogin;
    int     activated;

	//  Used if the password needs to be resend.
    String question;
    String answer;


}
