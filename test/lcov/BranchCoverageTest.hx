package lcov;

/** Tests the features of the `BranchCoverage` class. **/
@:asserts class BranchCoverageTest {

	/** Creates a new test suite. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	public function testToString() {
		// It should return a format like "BRF:<found>\nBRH:<hit>".
		final data = new BranchData(127, 3, 2, 1);
		asserts.assert(new BranchCoverage().toString() == "BRF:0\nBRH:0");
		asserts.assert(new BranchCoverage(23, 11, [data]).toString() == '$data\nBRF:23\nBRH:11');
		return asserts.done();
	}
}
