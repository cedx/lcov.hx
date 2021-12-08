import lcov.Report;
import sys.io.File;
import tink.Json;

/** Parses a LCOV report to coverage data. **/
function main() switch Report.fromString(File.getContent("/path/to/lcov.info")) {
	case Failure(error):
		Sys.println('An error occurred: "${error.message}" at offset ${error.data}.');
	case Success(report):
		Sys.println('The coverage report contains ${report.records.length} records:');
		Sys.println(Json.stringify(report, null, "\t"));
}
