
/**
 * Define a binding to external systems.
 * Map id from external system to internal player number.
 */
class PlayerExternalBinding {
	static belongsTo = [player:Player]
	static mapping = {
    	columns {
        	externalId column:'external_id', index:'external_id_Idx'
        }
    }

    static constraints = {
		player(blank:false, unique:true)
		externalId(blank:false, unique:true)
    }

	Player player;
	String externalId;
}