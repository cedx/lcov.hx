package lcov;

/** Tests the features of the `Record` class. **/
class RecordTest extends Test {

	/** Tests the `toJson()` method. **/
	public function testToJson() {
		// It should return a map with default values for a newly created instance.
		final map = new Record("").toJson();
		Assert.equals(4, Reflect.fields(map).length);
		Assert.isNull(map.branches);
		Assert.isNull(map.functions);
		Assert.isNull(map.lines);
		Assert.equals(0, map.sourceFile.length);

		// It should return a non-empty map for an initialized instance.
		final record = new Record("/home/cedx/lcov.hx", {
			branches: new BranchCoverage(),
			functions: new FunctionCoverage(),
			lines: new LineCoverage()
		});

		final map = record.toJson();
		Assert.equals(4, Reflect.fields(map).length);
		Assert.isTrue(Reflect.isObject(map.branches));
		Assert.isTrue(Reflect.isObject(map.functions));
		Assert.isTrue(Reflect.isObject(map.lines));
		Assert.equals("/home/cedx/lcov.hx", map.sourceFile);
	}

	/** Tests the `toString()` method. **/
	public function testToString() {
		// It should return a format like "SF:<sourceFile>\nend_of_record".
		Assert.equals("SF:\nend_of_record", Std.string(new Record("")));

		final record = new Record("/home/cedx/lcov.hx", {
			branches: new BranchCoverage(),
			functions: new FunctionCoverage(),
			lines: new LineCoverage()
		});

		Assert.equals('SF:/home/cedx/lcov.hx\n${record.functions}\n${record.branches}\n${record.lines}\nend_of_record', Std.string(record));
	}
}
