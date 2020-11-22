package lcov;

/** Tests the features of the `LineData` class. **/
class LineDataTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	@:variant(new lcov.LineData(0), "DA:0,0")
	@:variant(new lcov.LineData(127, 3, "ed076287532e86365e841e92bfc50d8c"), "DA:127,3,ed076287532e86365e841e92bfc50d8c")
	public function testToString(input: LineData, output: String)
		return assert(input.toString() == output);
}
