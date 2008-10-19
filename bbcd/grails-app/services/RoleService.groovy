
/**
 * 
 * Service for retrieving Role objects
 * 
 * @author jbl
 */
class RoleService {
	 
	 /**
	  * @return the roles not granted a user
	  */
	 def missingRoles(Profile profile) {
		 
		 // It seems there is a but in the genereted query from the following.
		 //return Role.executeQuery("""select r from Role as r where r.id not in (select p.authorities from Profile as p)""")
		 Set roles = new HashSet(Role.executeQuery("select r from Role as r"))
		 roles.removeAll(profile.authorities)
		 return roles
	 }
}