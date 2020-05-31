package lcov;

import sys.io.File;

/** Tests the features of the `Report` class. **/
class ReportTest extends Test {

	/** Tests the `fromCoverage()` method. **/
	function testFromCoverage() {
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

	/** Tests the `toString()` method. **/
	function testToString(): Void {
		// It should return a format like "TN:<testName>".
		final record = new Record("");
		Assert.equals(0, new Report().toString().length);
		Assert.equals('TN:LcovTest\n$record', new Report("LcovTest", [record]).toString());
	}
}
