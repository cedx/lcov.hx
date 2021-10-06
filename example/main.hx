import lcov.*;
import sys.io.File;
import tink.Json;

/** Formats coverage data as LCOV report. **/
function formatReport() {
	final lineCoverage = new LineCoverage({found: 2, hit: 2, data: [
		new LineData({lineNumber: 6, executionCount: 2, checksum: "PF4Rz2r7RTliO9u6bZ7h6g"}),
		new LineData({lineNumber: 7, executionCount: 2, checksum: "yGMB6FhEEAd8OyASe3Ni1w"})
	]});

	final record = new Record({
		sourceFile: "/home/cedx/lcov.hx/fixture.hx",
		functions: new FunctionCoverage({found: 1, hit: 1}),
		lines: lineCoverage
	});

	final report = new Report({testName: "Example", records: [record]});
	Sys.println(report.toString());
}

/** Parses a LCOV report to coverage data. **/
function parseReport() try {
	final report = Report.fromCoverage(File.getContent("/path/to/lcov.info"));
	Sys.println('The coverage report contains ${report.records.length} records:');
	Sys.println(Json.stringify(report, null, "\t"));
} catch (e: LcovException) Sys.println('An error occurred: "${e.message}" at offset ${e.offset}.');
