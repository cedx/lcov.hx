package lcov;

/** Tests the features of the `FunctionCoverage` class. **/
@:asserts class FunctionCoverageTest {

	/** Creates a new test suite. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	public function testToString() {
		// It should return a format like "FNF:<found>\nFNH:<hit>".
		final coverage = new FunctionCoverage(23, 11, [new FunctionData("main", 127, 3)]);
		asserts.assert(new FunctionCoverage().toString() == "FNF:0\nFNH:0");
		asserts.assert(coverage.toString() == "FN:127,main\nFNDA:3,main\nFNF:23\nFNH:11");
		return asserts.done();
	}
}
