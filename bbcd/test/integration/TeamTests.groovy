class TeamTests extends BaseBBCGroovyTestCase {

    void testNoOfTeams() {
        def teams = Team.list()
        assert teams.size() == 4
    }

    void testNoOfTeamPlayers() {
        def teams = Team.list()
        teams.each {
            assert it.players.size() == 2
        }
    }
}
