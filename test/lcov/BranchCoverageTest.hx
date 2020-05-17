package lcov;

/** Tests the features of the `BranchCoverage` class. **/
class BranchCoverageTest extends Test {

	/** Tests the `fromJson()` method. **/
	public function testFromJson() {
		// It should return an instance with default values for an empty map", () -> {
		final coverage = BranchCoverage.fromJson({});
		Assert.isTrue(coverage.data.empty());
		Assert.equals(0, coverage.found);
		Assert.equals(0, coverage.hit);

		// It should return an initialized instance for a non-empty map", () -> {
		final coverage = BranchCoverage.fromJson({
			data: [{lineNumber: 127}],
			found: 23,
			hit: 11
		});

		Assert.equals(1, coverage.data.length);
		Assert.is(coverage.data[0], BranchData);
		Assert.equals(127, coverage.data[0].lineNumber);
		Assert.equals(23, coverage.found);
		Assert.equals(11, coverage.hit);
	}

	/** Tests the `toJson()` method. **/
	public function testToJson() {
		// It should return a map with default values for a newly created instance", () -> {
		final map = new BranchCoverage().toJson();
		Assert.equals(3, Reflect.fields(map).length);
		Assert.is(map.data, Array);
		Assert.isTrue(map.data.empty());
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
		Assert.equals("BRF:0\nBRH:0", Std.string(new BranchCoverage()));

		final data = new BranchData(127, 3, 2, 1);
		Assert.equals('$data\nBRF:23\nBRH:11', Std.string(new BranchCoverage(23, 11, [data])));
	}
}
