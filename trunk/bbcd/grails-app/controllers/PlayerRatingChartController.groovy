import dk.brondbybordtennisclub.bbcd.util.MathUtilimport org.jfree.chart.ChartFactory
import org.jfree.data.category.DefaultCategoryDataset
import org.jfree.chart.encoders.EncoderUtil
import org.jfree.chart.plot.PlotOrientation

/**
 *
 * Responsible for constructing data for the open flash chart
 *
 * @author jbl
 */
class PlayerRatingChartController {

	def index = { redirect(action:show, params:params) }

    /**
     * Given playerid get rating data for the open flash chart     *     * E.g. http://localhost:8080/bbcd/playerRatingChart/show?externalId=jess&defaultClubXmlId=60806     * The above will redirect to playerExternalBinding if "jess" is not found, and show all      * avaible players from the given clubid
     */
	def show = {    		def playerExternalBinding = PlayerExternalBinding.findByExternalId(params.externalId)    		if(playerExternalBinding != null) {	    		def player = playerExternalBinding.getPlayer()
				StringBuffer ratingData = new StringBuffer();
                StringBuffer ratingUpdateData = new StringBuffer();
                // Filter out unchanged ratingdata                def result = filterResultSet(player.getRatings())                // Iterate the rating data and add to multivalue strings for the open flash chart plugin
                int i=0
                int resultSize = result.size()
				result.each { rating ->
					i++;
					ratingData.append("${rating.getRating()}")
					ratingUpdateData.append("${rating.getRatingUpdate()}")

					if(i != resultSize) {
						ratingData.append(",")
						ratingUpdateData.append(",")
					}
				}

                // Determine min and max (add 50 to top and bottom of graph)
                Integer minRating = MathUtil.floor(result.first().getRating()-50, 50);                Integer maxRating = MathUtil.ceil(result.last().getRating()+50, 50);

				return [ratingData:ratingData.toString(),
	                       ratingUpdateData:ratingUpdateData.toString(),
	                       minRating:minRating, maxRating:maxRating,	                       playerInfo:player.getName()]
			} else {				redirect(controller:"playerExternalBinding", action:"create", params:params)
    		}
	    }    /*     * We only want to show:     * - The first rating entry     * - Only rating data that have changed since the last update     * - The last rating entry     */    def filterResultSet(def ratingList) {         def resultSorted = new TreeSet()         // Add first rating to resultSet         def previousRating = ratingList.first()         resultSorted.add(previousRating)          // Only add ratingdata that have changed since the last update         ratingList.each { element ->	         if(element.getRating() != previousRating.getRating()) {	             resultSorted.add(element)	         }	         previousRating = element         }         // Add the last rating entry         resultSorted.add(ratingList.last())         return resultSorted     }}