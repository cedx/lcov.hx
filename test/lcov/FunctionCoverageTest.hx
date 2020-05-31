package lcov;

/** Tests the features of the `FunctionCoverage` class. **/
class FunctionCoverageTest extends Test {

	/** Tests the `toString()` method. **/
	function testToString(): Void {
		// It should return a format like "FNF:<found>\nFNH:<hit>".
		final coverage = new FunctionCoverage(23, 11, [new FunctionData("main", 127, 3)]);
		Assert.equals("FNF:0\nFNH:0", new FunctionCoverage().toString());
		Assert.equals("FN:127,main\nFNDA:3,main\nFNF:23\nFNH:11", coverage.toString());
	}
}
