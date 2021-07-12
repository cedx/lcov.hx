import haxe.Json;
import lcov.*;
import sys.io.File;

/** A sample class. **/
class Example {

	/** Formats coverage data as LCOV report. **/
	public function formatReport() {
		final lineCoverage = new LineCoverage(2, 2, [
			{lineNumber: 6, executionCount: 2, checksum: "PF4Rz2r7RTliO9u6bZ7h6g"},
			{lineNumber: 7, executionCount: 2, checksum: "yGMB6FhEEAd8OyASe3Ni1w"}
		]);

		final record = new Record("/home/cedx/lcov.hx/fixture.hx", {
			functions: new FunctionCoverage(1, 1),
			lines: lineCoverage
		});

		final report = new Report("Example", [record]);
		Sys.println(report.toString());
	}

	/** Parses a LCOV report to coverage data. **/
	public function parseReport() try {
		final coverage = File.getContent("/path/to/lcov.info");
		final report = Report.fromCoverage(coverage);
		Sys.println('The coverage report contains ${report.records.length} records:');
		Sys.println(Json.stringify(report, null, "\t"));
	} catch (e: LcovException) Sys.println('An error occurred: "${e.message}" at offset ${e.offset}.');
}
