/**
 * Responsible for defining the credit advance or decrease 
 * depending on rating status
 */
class PointsRuleData {
	
	static {
		new PointsRule(fromRating:-10000, toRating:-30, credit:-30000).save()
     	new PointsRule(fromRating:-29, toRating:-20, credit:-20000).save()
     	new PointsRule(fromRating:-19, toRating:-10, credit:-15000).save()
     	new PointsRule(fromRating:-9, toRating:0, credit:-10000).save()
     	new PointsRule(fromRating:1, toRating:10, credit:10000).save()
     	new PointsRule(fromRating:11, toRating:15, credit:15000).save()
     	new PointsRule(fromRating:21, toRating:30, credit:20000).save()
     	new PointsRule(fromRating:31, toRating:10000, credit:30000).save()
	}
}