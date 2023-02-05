import lcov.Report;
import sys.io.File;
import tink.Json;

/** Parses a LCOV report to coverage data. **/
function main() switch Report.parse(File.getContent("/path/to/lcov.info")) {
	case Failure(error):
		Sys.println(error.message);
	case Success(report):
		Sys.println('The coverage report contains ${report.sourceFiles.length} source files:');
		Sys.println(Json.stringify(report));
}
