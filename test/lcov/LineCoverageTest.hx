package lcov;

/** Tests the features of the `LineCoverage` class. **/
class LineCoverageTest extends Test {

	/** Tests the `toJson()` method. **/
	public function testToJson() {
		// It should return a map with default values for a newly created instance.
		var map = new LineCoverage().toJson();
		Assert.equals(3, Reflect.fields(map).length);
		Assert.is(map.data, Array);
		Assert.equals(0, map.data.length);
		Assert.equals(0, map.found);
		Assert.equals(0, map.hit);

		// It should return a non-empty map for an initialized instance.
		map = new LineCoverage(23, 11, [new LineData(0)]).toJson();
		Assert.equals(3, Reflect.fields(map).length);
		Assert.is(map.data, Array);
		Assert.equals(1, map.data.length);
		Assert.isTrue(Reflect.isObject(map.data[0]));
		Assert.is(map.data[0].lineNumber, Int);
		Assert.equals(23, map.found);
		Assert.equals(11, map.hit);
	}

	/** Tests the `toString()` method. **/
	public function testToString() {
		// It should return a format like "LF:<found>\nLH:<hit>".
		final data = new LineData(127, 3);
		Assert.equals("LF:0\nLH:0", new LineCoverage().toString());
		Assert.equals('$data\nLF:23\nLH:11', new LineCoverage(23, 11, [data]).toString());
	}
}
