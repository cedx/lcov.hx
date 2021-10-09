import lcov.LcovException;
import lcov.Report;
import sys.io.File;
import tink.Json;

/** Parses a LCOV report to coverage data. **/
function parseReport() try {
	final report = Report.fromCoverage(File.getContent("/path/to/lcov.info"));
	Sys.println('The coverage report contains ${report.records.length} records:');
	Sys.println(Json.stringify(report, null, "\t"));
} catch (e: LcovException) Sys.println('An error occurred: "${e.message}" at offset ${e.offset}.');
