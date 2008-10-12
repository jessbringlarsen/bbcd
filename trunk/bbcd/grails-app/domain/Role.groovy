/**
 * Role class for Authority.
 */
class Role {

	static hasMany = [people: Profile]

	/** description */
	String description
	/** ROLE String */
	String authority = 'ROLE_'

	static constraints = {
		authority(blank: false)
		description()
	}
	
	public String toString() {
		return authority;
	}
}
