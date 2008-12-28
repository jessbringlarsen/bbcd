class PlayerTests extends BaseBBCGroovyTestCase {


    void testNoOfPlayers() {
        def players = Player.list()
        assert players.size() == testHelper.getTotalNumberOfPlayers()
    }

     void testNoOfPlayerTeams() {
        def players = Player.list()
        players.each {
            assert it.getTeams().size() == 1
        }
    }
}
