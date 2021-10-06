package lcov;

/** Tests the features of the `LineCoverage` class. **/
class LineCoverageTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	@:variant({}, "LF:0\nLH:0")
	@:variant({found: 23, hit: 11, data: [new lcov.LineData({lineNumber: 127, executionCount: 3})]}, "DA:127,3\nLF:23\nLH:11")
	public function testToString(input, output: String)
		return assert(new LineCoverage(input).toString() == output);
}
