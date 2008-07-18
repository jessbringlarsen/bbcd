class Idraetsforbund {

	static mapping = {
    	columns {
    		name column:'name', index:'name_idx'
    		xmlId column:'xml_id', index:'xml_id_idx'
        }
    }
	
	static constraints = {
		xmlId(unique: true)
		name(blank: false, unique: true)
	}

	String name;
	String xmlId;

	public String toString() {
		return getName()
	}
}