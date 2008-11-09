
/**
 * Definerer hvilke alderklasser der findes for spillere.
 * Der findes flere aldersklasser defineret af DBTU,
 * (veteran) men disse opdateres ikke med rating.
 */
class LicenseClassAge {

    static hasMany = [licenseClass:LicenseClass]
    static constraints = {
		ageFrom(unique: 'ageTo')
	}

    Integer ageFrom;
    Integer ageTo;

    String toString() {
        "${ageFrom} - ${ageTo}"
    }
}
