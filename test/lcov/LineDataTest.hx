package lcov;

/** Tests the features of the `LineData` class. **/
class LineDataTest extends Test {

	/** Tests the `toJson()` method. **/
	public function testToJson() {
		// It should return a map with default values for a newly created instance.
		var map = new LineData(0).toJson();
		Assert.equals(3, Reflect.fields(map).length);
		Assert.equals(0, map.checksum.length);
		Assert.equals(0, map.executionCount);
		Assert.equals(0, map.lineNumber);

		// It should return a non-empty map for an initialized instance.
		map = new LineData(127, 3, "ed076287532e86365e841e92bfc50d8c").toJson();
		Assert.equals(3, Reflect.fields(map).length);
		Assert.equals("ed076287532e86365e841e92bfc50d8c", map.checksum);
		Assert.equals(3, map.executionCount);
		Assert.equals(127, map.lineNumber);
	}

	/** Tests the `toString()` method. **/
	public function testToString() {
		// It should return a format like "DA:<lineNumber>,<executionCount>[,<checksum>]".
		Assert.equals("DA:0,0", new LineData(0).toString());
		Assert.equals("DA:127,3,ed076287532e86365e841e92bfc50d8c", new LineData(127, 3, "ed076287532e86365e841e92bfc50d8c").toString());
	}
}
