package dk.brondbybordtennisclub.bbc.util;

import dk.brondbybordtennisclub.bbcd.util.MathUtil;
import junit.framework.Assert;
import junit.framework.TestCase;

public class MathUtilTest extends TestCase {

	public void testCeil() {
		Assert.assertEquals(0, MathUtil.ceil(-1, 100));
		Assert.assertEquals(100, MathUtil.ceil(0, 100));
		Assert.assertEquals(100, MathUtil.ceil(1, 100));
		Assert.assertEquals(1800, MathUtil.ceil(1798, 100));

		Assert.assertEquals(0, MathUtil.ceil(-1, 0));
		Assert.assertEquals(100, MathUtil.ceil(0, 100));
		Assert.assertEquals(1, MathUtil.ceil(1, 0));
		Assert.assertEquals(1760, MathUtil.ceil(1758, 10));
	}
}
