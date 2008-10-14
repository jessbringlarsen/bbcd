import dk.brondbybordtennisclub.bbcd.util.MathUtil
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
     * Given playerid get rating data for the open flash chart
     */
	def show = {
				StringBuffer ratingData = new StringBuffer();
                StringBuffer ratingUpdateData = new StringBuffer();

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
                Integer minRating = MathUtil.floor(result.first().getRating()-50, 50);

				return [ratingData:ratingData.toString(),
	                       ratingUpdateData:ratingUpdateData.toString(),
	                       minRating:minRating, maxRating:maxRating,
			} else {
    		}
	    }