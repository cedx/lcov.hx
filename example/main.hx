import haxe.Json;
import lcov.*;
import sys.io.File;

/** A sample class. **/
class Example {

	/** Formats coverage data as LCOV report. **/
	public function formatReport(): Void {
		final lineCoverage = new LineCoverage(2, 2, [
			new LineData(6, 2, "PF4Rz2r7RTliO9u6bZ7h6g"),
			new LineData(7, 2, "yGMB6FhEEAd8OyASe3Ni1w")
		]);

		final record = new Record("/home/cedx/lcov.hx/fixture.hx", {
			functions: new FunctionCoverage(1, 1),
			lines: lineCoverage
		});

		final report = new Report("Example", [record]);
		Sys.println(report);
	}

	/** Parses a LCOV report to coverage data. **/
	public function parseReport(): Void {
		try {
			final coverage = File.getContent("/path/to/lcov.info");
			final report = Report.fromCoverage(coverage);
			Sys.println('The coverage report contains ${report.records.length} records:');
			Sys.println(Json.stringify(report, null, "  "));
		}

		catch (error: LcovException) {
			Sys.println('An error occurred: "${error.message}" at offset ${error.offset}.');
		}
	}
}
