package lcov;

/** Tests the features of the `FunctionCoverage` class. **/
class FunctionCoverageTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	@:variant(new lcov.FunctionCoverage(), "FNF:0\nFNH:0")
	@:variant(new lcov.FunctionCoverage(23, 11, [new lcov.FunctionData("main", 127, 3)]), "FN:127,main\nFNDA:3,main\nFNF:23\nFNH:11")
	public function testToString(input: FunctionCoverage, output: String)
		return assert(input.toString() == output);
}
