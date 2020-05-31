package lcov;

/** Tests the features of the `BranchCoverage` class. **/
class BranchCoverageTest extends Test {

	/** Tests the `toString()` method. **/
	function testToString(): Void {
		// It should return a format like "BRF:<found>\nBRH:<hit>".
		final data = new BranchData(127, 3, 2, 1);
		Assert.equals("BRF:0\nBRH:0", new BranchCoverage().toString());
		Assert.equals('$data\nBRF:23\nBRH:11', new BranchCoverage(23, 11, [data]).toString());
	}
}
