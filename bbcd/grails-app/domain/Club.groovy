class Club {
	static mapping = {
    	columns {
    		xmlId column:'xml_id', index:'xml_id_idx'
    		name column:'name', index:'name_idx'
    		shortName column:'short_name', index:'short_name_idx'
        }
    }

	String xmlId;
	String name;
	String shortName;
	Idraetsforbund union;

	public String toString() {
		return getName()
	}
}