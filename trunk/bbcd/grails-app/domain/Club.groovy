class Club {
	static mapping = {
    	columns {
    		xmlId column:'xml_id', index:'xml_id_idx'
    		name column:'name', index:'name_idx'
        }
    }
	
	static constraints = {
		xmlId(unique: true)
		name(unique: true)
	}

	String xmlId;
	String name;
	String shortName;
	Idraetsforbund union;

	public String toString() {
		return getName()
	}
}
