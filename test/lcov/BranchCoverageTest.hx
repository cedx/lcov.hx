package lcov;

/** Tests the features of the `BranchCoverage` class. **/
class BranchCoverageTest extends Test {

	/** Tests the `toJson()` method. **/
	public function testToJson() {
		// It should return a map with default values for a newly created instance", () -> {
		final map = new BranchCoverage().toJson();
		Assert.equals(3, Reflect.fields(map).length);
		Assert.is(map.data, Array);
		Assert.equals(0, map.data.length);
		Assert.equals(0, map.found);
		Assert.equals(0, map.hit);

		// It should return a non-empty map for an initialized instance", () -> {
		final map = new BranchCoverage(23, 11, [new BranchData(0, 0, 0)]).toJson();
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
		// It should return a format like "BRF:<found>\nBRH:<hit>".
		Assert.equals("BRF:0\nBRH:0", new BranchCoverage().toString());

		final data = new BranchData(127, 3, 2, 1);
		Assert.equals('$data\nBRF:23\nBRH:11', new BranchCoverage(23, 11, [data]).toString());
	}
}
