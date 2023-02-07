package lcov;

/** Tests the features of the `SourceFile` class. **/
@:asserts final class SourceFileTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	public function testToString() {
		final sourceFile = new SourceFile({
			branches: new BranchCoverage(),
			functions: new FunctionCoverage(),
			lines: new LineCoverage(),
			path: "/home/cedx/lcov.hx"
		});

		asserts.assert(new SourceFile({path: ""}).toString() == "SF:\nend_of_record");
		asserts.assert(sourceFile.toString() == 'SF:/home/cedx/lcov.hx\n${sourceFile.functions}\n${sourceFile.branches}\n${sourceFile.lines}\nend_of_record');
		return asserts.done();
	}
}
