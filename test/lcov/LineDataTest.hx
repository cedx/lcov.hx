package lcov;

/** Tests the features of the `LineData` class. **/
@:asserts class LineDataTest {

	/** Creates a new test suite. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	public function testToString() {
		// It should return a format like "DA:<lineNumber>,<executionCount>[,<checksum>]".
		asserts.assert(new LineData(0).toString() == "DA:0,0");
		asserts.assert(new LineData(127, 3, "ed076287532e86365e841e92bfc50d8c").toString() == "DA:127,3,ed076287532e86365e841e92bfc50d8c");
		return asserts.done();
	}
}
