/**
 *
 * @author jbl
 */
class BaseBBCGroovyTestCase extends GroovyTestCase {

    def testHelper

    protected void setUp() throws java.lang.Exception {
        testHelper = IntegrationTestHelper.getInstance()
    }

    void testDummy() {

    }
}

