class PlayerTests extends BaseBBCGroovyTestCase {

    void testNoOfPlayers() {
        def players = Player.list()
        assert players.size() == 8
    }
}
