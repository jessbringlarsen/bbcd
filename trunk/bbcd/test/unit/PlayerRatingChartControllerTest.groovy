
class PlayerRatingChartControllerTest extends GroovyTestCase {

	PlayerRatingChartController controller = new PlayerRatingChartController()

	void testSuccess() {
		Set ratingList = new TreeSet();
		1..10.each { i ->
			RatingUpdate ru = new RatingUpdate(dateOfUpdate: new Date());
			ratingList.add(new Rating(rating: i, ratingUpdate: ru))
		}


		def result = controller.filterResultSet(ratingList)
		assert result.size() == 1

	}
}