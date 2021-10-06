package lcov;

import haxe.Resource;
using AssertionTools;

/** Tests the features of the `Report` class. **/
@:asserts class ReportTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `fromCoverage()` method. **/
	public function testFromCoverage() {
		final report = Report.fromCoverage(Resource.getString("report"));
		final records = report.records.toArray();

		// It should have a test name.
		asserts.assert(report.testName == "Example");

		// It should contain three records.
		asserts.assert(records.length == 3);
		asserts.assert(Std.isOfType(records[0], Record));
		asserts.assert(records[0].sourceFile == "/home/cedx/lcov.hx/fixture.hx");
		asserts.assert(records[1].sourceFile == "/home/cedx/lcov.hx/func1.hx");
		asserts.assert(records[2].sourceFile == "/home/cedx/lcov.hx/func2.hx");

		// It should have detailed branch coverage.
		final branches = records[1].branches;
		asserts.assert(branches.found == 4);
		asserts.assert(branches.hit == 4);

		final data = branches.data.toArray();
		asserts.assert(data.length == 4);
		asserts.assert(Std.isOfType(data[0], BranchData));
		asserts.assert(data[0].lineNumber == 8);

		// It should have detailed function coverage.
		final functions = records[1].functions;
		asserts.assert(functions.found == 1);
		asserts.assert(functions.hit == 1);

		final data = functions.data.toArray();
		asserts.assert(data.length == 1);
		asserts.assert(Std.isOfType(data[0], FunctionData));
		asserts.assert(data[0].functionName == "func1");

		// It should have detailed line coverage.
		final lines = records[1].lines;
		asserts.assert(lines.found == 9);
		asserts.assert(lines.hit == 9);

		final data = lines.data.toArray();
		asserts.assert(data.length == 9);
		asserts.assert(Std.isOfType(data[0], LineData));
		asserts.assert(data[0].checksum == "5kX7OTfHFcjnS98fjeVqNA");

		// It should throw an exception if the input is invalid.
		asserts.throws(() -> Report.fromCoverage("ZZ"), LcovException);

		// It should throw an exception if the report is empty.
		asserts.throws(() -> Report.fromCoverage("TN:Example"), LcovException);
		return asserts.done();
	}

	/** Tests the `toString()` method. **/
	@:variant({}, "")
	@:variant({testName: "LcovTest", records: [new lcov.Record({sourceFile: ""})]}, "TN:LcovTest\nSF:\nend_of_record")
	public function testToString(input, output: String)
		return assert(new Report(input).toString() == output);
}
