package lcov;

/** Tests the features of the `LineData` class. **/
class LineDataTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	@:variant({lineNumber: 0}, "DA:0,0")
	@:variant({lineNumber: 127, executionCount: 3, checksum: "ed076287532e86365e841e92bfc50d8c"}, "DA:127,3,ed076287532e86365e841e92bfc50d8c")
	public function testToString(input, output: String)
		return assert(new LineData(input).toString() == output);
}
