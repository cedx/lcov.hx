package lcov;

/** Tests the features of the `LineData` class. **/
class LineDataTest extends Test {

	/** Tests the `toString()` method. **/
	public function testToString() {
		// It should return a format like "DA:<lineNumber>,<executionCount>[,<checksum>]".
		Assert.equals("DA:0,0", new LineData(0).toString());
		Assert.equals("DA:127,3,ed076287532e86365e841e92bfc50d8c", new LineData(127, 3, "ed076287532e86365e841e92bfc50d8c").toString());
	}
}
