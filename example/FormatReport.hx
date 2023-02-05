import lcov.FunctionCoverage;
import lcov.LineCoverage;
import lcov.LineData;
import lcov.Report;
import lcov.SourceFile;

/** Formats coverage data as LCOV report. **/
function main() {
	final sourceFile = new SourceFile({
		path: "/home/cedx/lcov.hx/fixture.hx",
		functions: new FunctionCoverage({found: 1, hit: 1}),
		lines: new LineCoverage({found: 2, hit: 2, data: [
			new LineData({lineNumber: 6, executionCount: 2, checksum: "PF4Rz2r7RTliO9u6bZ7h6g"}),
			new LineData({lineNumber: 7, executionCount: 2, checksum: "yGMB6FhEEAd8OyASe3Ni1w"})
		]})
	});

	final report = new Report({testName: "Example", sourceFiles: [sourceFile]});
	Sys.println(report.toString());
}
