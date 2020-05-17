package lcov;

/** Tests the features of the `BranchData` class. **/
class BranchDataTest extends Test {

	/** Tests the `fromJson()` method. **/
	public function testFromJson() {
		// It should return an instance with default values for an empty map.
		final data = BranchData.fromJson({});
		Assert.equals(0, data.blockNumber);
		Assert.equals(0, data.branchNumber);
		Assert.equals(0, data.lineNumber);
		Assert.equals(0, data.taken);

		// It should return an initialized instance for a non-empty map.
		final data = BranchData.fromJson({
			blockNumber: 3,
			branchNumber: 2,
			lineNumber: 127,
			taken: 1
		});

		Assert.equals(3, data.blockNumber);
		Assert.equals(2, data.branchNumber);
		Assert.equals(127, data.lineNumber);
		Assert.equals(1, data.taken);
	}

	/** Tests the `toJson()` method. **/
	public function testToJson() {
		// It should return a map with default values for a newly created instance.
		final map = new BranchData(0, 0, 0).toJson();
		Assert.equals(4, Reflect.fields(map).length);
		Assert.equals(0, map.blockNumber);
		Assert.equals(0, map.branchNumber);
		Assert.equals(0, map.lineNumber);
		Assert.equals(0, map.taken);

		// It should return a non-empty map for an initialized instance.
		final map = new BranchData(127, 3, 2, 1).toJson();
		Assert.equals(4, Reflect.fields(map).length);
		Assert.equals(3, map.blockNumber);
		Assert.equals(2, map.branchNumber);
		Assert.equals(127, map.lineNumber);
		Assert.equals(1, map.taken);
	}

	/** Tests the `toString()` method. **/
	public function testToString() {
		// It should return a format like "BRDA:<lineNumber>,<blockNumber>,<branchNumber>,<taken>".
		Assert.equals("BRDA:0,0,0,-", Std.string(new BranchData(0, 0, 0)));
		Assert.equals("BRDA:127,3,2,1", Std.string(new BranchData(127, 3, 2, 1)));
	}
}
