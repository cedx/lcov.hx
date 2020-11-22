package lcov;

/** Tests the features of the `LineCoverage` class. **/
class LineCoverageTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	@:variant(new lcov.LineCoverage(), "LF:0\nLH:0")
	@:variant(new lcov.LineCoverage(23, 11, [new lcov.LineData(127, 3)]), "DA:127,3\nLF:23\nLH:11")
	public function testToString(input: LineCoverage, output: String)
		return assert(input.toString() == output);
}
