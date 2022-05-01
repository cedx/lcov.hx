package lcov;

/** Tests the features of the `File` class. **/
@:asserts class FileTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	public function testToString() {
		final file = new File({
			path: "/home/cedx/lcov.hx",
			branches: new BranchCoverage(),
			functions: new FunctionCoverage(),
			lines: new LineCoverage()
		});

		asserts.assert(new File({path: ""}).toString() == "SF:\nend_of_record");
		asserts.assert(file.toString() == 'SF:/home/cedx/lcov.hx\n${file.functions}\n${file.branches}\n${file.lines}\nend_of_record');
		return asserts.done();
	}
}
