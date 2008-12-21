class PlayerTests extends BaseBBCGroovyTestCase {

    void testNoOfPlayers() {
        def players = Player.list()
        assert players.size() == 8
    }

     void testNoOfPlayerTeams() {
        def players = Player.list()
        players.each {
            assert it.getTeams().size() == 2
        }
    }
}
