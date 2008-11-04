class LicenseClass {
    
    static constraints = {
		className(unique: 'gender')
		gender(blank: false)
		minRating(blank: false)
		maxRating(blank: false)
		price(blank: false)
	}

    String className
	String gender
	Integer minRating
	Integer maxRating
    LicenseClassPrice price

    String toString() {
        return "${className} - ${gender}"
    }

}
