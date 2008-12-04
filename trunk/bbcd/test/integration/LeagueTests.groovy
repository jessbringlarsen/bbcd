class LeagueTests extends BaseBBCGroovyTestCase {

   void testNoOfLeauges() {
        def leagues = League.list()
        assert leagues.size() == 2
    }

    void testNoOfTeamPlayers() {
        def leagues = League.list()
        leagues.each {
            assert it.teams.size() == 2
        }
    }
}
