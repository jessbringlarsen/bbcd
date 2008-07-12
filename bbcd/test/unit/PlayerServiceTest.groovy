
class PlayerServiceTest extends GroovyTestCase {

	void testSuccess() {
		Club club = Club.findByXmlId("60711")

		PlayerService playerService = new PlayerService();
		def players = playerService.getByClub(club)

		assert players != null
		assert players.size() != 0

	}
}