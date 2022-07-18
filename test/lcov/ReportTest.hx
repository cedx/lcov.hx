package lcov;

import haxe.Resource;

/** Tests the features of the `Report` class. **/
@:asserts class ReportTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `parse()` method. **/
	public function testParse() {
		final report = Report.parse(Resource.getString("report")).sure();
		final sourceFiles = report.sourceFiles.toArray();

		// It should have a test name.
		asserts.assert(report.testName == "Example");

		// It should contain three source files.
		asserts.assert(sourceFiles.length == 3);
		asserts.assert(sourceFiles[0].path == "/home/cedx/lcov.hx/fixture.hx");
		asserts.assert(sourceFiles[1].path == "/home/cedx/lcov.hx/func1.hx");
		asserts.assert(sourceFiles[2].path == "/home/cedx/lcov.hx/func2.hx");

		// It should have detailed branch coverage.
		final branches = sourceFiles[1].branches;
		asserts.assert(branches.found == 4);
		asserts.assert(branches.hit == 4);

		final data = branches.data.toArray();
		asserts.assert(data.length == 4);
		asserts.assert(data[0].lineNumber == 8);

		// It should have detailed function coverage.
		final functions = sourceFiles[1].functions;
		asserts.assert(functions.found == 1);
		asserts.assert(functions.hit == 1);

		final data = functions.data.toArray();
		asserts.assert(data.length == 1);
		asserts.assert(data[0].functionName == "func1");

		// It should have detailed line coverage.
		final lines = sourceFiles[1].lines;
		asserts.assert(lines.found == 9);
		asserts.assert(lines.hit == 9);

		final data = lines.data.toArray();
		asserts.assert(data.length == 9);
		asserts.assert(data[0].checksum == "5kX7OTfHFcjnS98fjeVqNA");

		// It should return a failure if the input is invalid.
		asserts.assert(!Report.parse("ZZ").isSuccess());

		// It should return a failure if the report is empty.
		asserts.assert(!Report.parse("TN:Example").isSuccess());
		return asserts.done();
	}

	/** Tests the `toString()` method. **/
	@:variant({testName: ""}, "")
	@:variant({testName: "LcovTest", sourceFiles: [new lcov.SourceFile({path: ""})]}, "TN:LcovTest\nSF:\nend_of_record")
	public function testToString(input, output: String)
		return assert(new Report(input).toString() == output);
}
