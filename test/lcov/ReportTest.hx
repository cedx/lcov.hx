package lcov;

import sys.io.File;

/** Tests the features of the `Report` class. **/
class ReportTest extends Test {

	/** Tests the `fromCoverage()` method. **/
	public function testFromCoverage() {
		final report = Report.fromCoverage(File.getContent("test/fixtures/lcov.info"));

		// It should have a test name.
		Assert.equals("Example", report.testName);

		// It should contain three records.
		Assert.equals(3, report.records.length);
		Assert.is(report.records[0], Record);
		Assert.equals("/home/cedx/lcov.hx/fixture.hx", report.records[0].sourceFile);
		Assert.equals("/home/cedx/lcov.hx/func1.hx", report.records[1].sourceFile);
		Assert.equals("/home/cedx/lcov.hx/func2.hx", report.records[2].sourceFile);

		// It should have detailed branch coverage.
		final branches = report.records[1].branches;
		Assert.equals(4, branches.found);
		Assert.equals(4, branches.hit);

		Assert.equals(4, branches.data.length);
		Assert.is(branches.data[0], BranchData);
		Assert.equals(8, branches.data[0].lineNumber);

		// It should have detailed function coverage.
		final functions = report.records[1].functions;
		Assert.equals(1, functions.found);
		Assert.equals(1, functions.hit);

		Assert.equals(1, functions.data.length);
		Assert.is(functions.data[0], FunctionData);
		Assert.equals("func1", functions.data[0].functionName);

		// It should have detailed line coverage.
		final lines = report.records[1].lines;
		Assert.equals(9, lines.found);
		Assert.equals(9, lines.hit);

		Assert.equals(9, lines.data.length);
		Assert.is(lines.data[0], LineData);
		Assert.equals("5kX7OTfHFcjnS98fjeVqNA", lines.data[0].checksum);

		// It should throw an error if the input is invalid.
		Assert.raises(() -> Report.fromCoverage("ZZ"), LcovException);

		// It should throw an error if the report is empty.
		Assert.raises(() -> Report.fromCoverage("TN:Example"), LcovException);
	}

	/** Tests the `fromJson()` method. **/
	public function testFromJson() {
		// It should return an instance with default values for an empty map.
		final report = Report.fromJson({});
		Assert.isTrue(report.records.empty());
		Assert.equals(0, report.testName.length);

		// It should return an initialized instance for a non-empty map.
		final report = Report.fromJson({
			records: [{}],
			testName: "LcovTest"
		});

		Assert.equals(1, report.records.length);
		Assert.is(report.records[0], Record);
		Assert.equals("LcovTest", report.testName);
	}

	/** Tests the `toJson()` method. **/
	public function testToJson() {
		// It should return a map with default values for a newly created instance.
		final map = new Report().toJson();
		Assert.equals(2, Reflect.fields(map).length);
		Assert.is(map.records, Array);
		Assert.isTrue(map.records.empty());
		Assert.equals(0, map.testName.length);

		// It should return a non-empty map for an initialized instance.
		final map = new Report("LcovTest", [new Record("")]).toJson();
		Assert.equals(2, Reflect.fields(map).length);
		Assert.is(map.records, Array);
		Assert.equals(1, map.records.length);
		Assert.isTrue(Reflect.isObject(map.records[0]));
		Assert.equals("LcovTest", map.testName);
	}

	/** Tests the `toString()` method. **/
	public function testToString() {
		// It should return a format like "TN:<testName>".
		Assert.equals(0, Std.string(new Report()).length);

		final record = new Record("");
		Assert.equals('TN:LcovTest\n$record', Std.string(new Report("LcovTest", [record])));
	}
}
