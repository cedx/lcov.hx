package lcov;

/** Tests the features of the `FunctionCoverage` class. **/
final class FunctionCoverageTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	@:variant({}, "FNF:0\nFNH:0")
	@:variant({found: 23, hit: 11, data: [new lcov.FunctionData({functionName: "main", lineNumber: 127, executionCount: 3})]}, "FN:127,main\nFNDA:3,main\nFNF:23\nFNH:11")
	public function testToString(input, output: String)
		return assert(new FunctionCoverage(input).toString() == output);
}
