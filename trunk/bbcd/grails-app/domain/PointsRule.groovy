
/**
 * 
 * Class that define the de- or credit in-crease when a player gain or looses
 * rating points. 
 * 
 * @author jbl
 */
class PointsRule {
	
	static mapping = {
    	columns {
    		toRating index:'to_rating_idx'
    		fromRating index:'from_rating_idx'
        }
    }

	Integer toRating
	Integer fromRating
	Integer credit

}
