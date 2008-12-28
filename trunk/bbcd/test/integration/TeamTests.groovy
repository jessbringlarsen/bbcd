class TeamTests extends BaseBBCGroovyTestCase {

    void testNoOfTeams() {
        def teams = Team.list()
        assert teams.size() == testHelper.getTotalNumberOfTeams()
    }

    void testNoOfTeamPlayers() {
        def teams = Team.list()
        teams.each {
            assert it.getPlayers().size() == 2
        }
    }
}
