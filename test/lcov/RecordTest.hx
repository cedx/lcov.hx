package lcov;

/** Tests the features of the `Record` class. **/
@:asserts class RecordTest {

	/** Creates a new test suite. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	public function testToString() {
		// It should return a format like "SF:<sourceFile>\nend_of_record".
		final record = new Record("/home/cedx/lcov.hx", {
			branches: new BranchCoverage(),
			functions: new FunctionCoverage(),
			lines: new LineCoverage()
		});

		asserts.assert(new Record("").toString() == "SF:\nend_of_record");
		asserts.assert(record.toString() == 'SF:/home/cedx/lcov.hx\n${record.functions}\n${record.branches}\n${record.lines}\nend_of_record');
		return asserts.done();
	}
}
