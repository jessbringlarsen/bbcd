class PlayerViewServiceTests extends BaseBBCGroovyTestCase {

    def playerViewService;

    void testGetByTeam() {
        IntegrationTestHelper.getInstance().teams.each {
            def result = playerViewService.getByTeam(it.getId())
            
            assert result.size() == 2
        }
    }
}
