package lcov;

/** Tests the features of the `Record` class. **/
class RecordTest extends Test {

	/** Tests the `toString()` method. **/
	function testToString() {
		// It should return a format like "SF:<sourceFile>\nend_of_record".
		final record = new Record("/home/cedx/lcov.hx", {
			branches: new BranchCoverage(),
			functions: new FunctionCoverage(),
			lines: new LineCoverage()
		});

		Assert.equals("SF:\nend_of_record", new Record("").toString());
		Assert.equals('SF:/home/cedx/lcov.hx\n${record.functions}\n${record.branches}\n${record.lines}\nend_of_record', record.toString());
	}
}
