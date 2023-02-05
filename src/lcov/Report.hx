package lcov;

import coconut.data.List;
import coconut.data.Model;
using StringTools;

/** Represents a trace file, that is a coverage report. **/
@:jsonParse(json -> new lcov.Report(json))
@:jsonStringify(report -> {sourceFiles: report.sourceFiles, testName: report.testName})
class Report implements Model {

	/** The source file list. **/
	@:editable var sourceFiles: List<SourceFile> = @byDefault new List();

	/** The test name. **/
	@:editable var testName: String;

	/** Parses the specified `coverage` data in [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) format. **/
	public static function parse(coverage: String) {
		final report = new Report({testName: ""});
		var offset = 0;
		var sourceFile = new SourceFile({path: ""});

		for (line in ~/\r?\n/g.split(coverage)) {
			offset++;
			line = line.trim();
			if (line.length == 0) continue;

			final parts = line.split(":");
			if (parts.length < 2 && parts[0] != Token.EndOfRecord)
				return Failure(new Error(UnprocessableEntity, 'Invalid token format at line #$offset.'));

			final token: Token = parts.shift();
			final data = parts.join(":").split(",");

			switch token {
				case TestName: if (report.testName.length == 0) report.testName = data[0];
				case EndOfRecord: report.sourceFiles = report.sourceFiles.append(sourceFile);

				case BranchData:
					if (data.length < 4) return Failure(new Error(UnprocessableEntity, 'Invalid branch data at line #$offset.'));
					if (sourceFile.branches != null) sourceFile.branches.data = sourceFile.branches.data.append(new BranchData({
						blockNumber: Std.parseInt(data[1]),
						branchNumber: Std.parseInt(data[2]),
						lineNumber: Std.parseInt(data[0]),
						taken: data[3] == "-" ? 0 : Std.parseInt(data[3])
					}));

				case FunctionData:
					if (data.length < 2) return Failure(new Error(UnprocessableEntity, 'Invalid function data at line #$offset.'));
					if (sourceFile.functions != null) for (item in sourceFile.functions.data) if (item.functionName == data[1]) {
						item.executionCount = Std.parseInt(data[0]);
						break;
					}

				case FunctionName:
					if (data.length < 2) return Failure(new Error(UnprocessableEntity, 'Invalid function name at line #$offset.'));
					if (sourceFile.functions != null)
						sourceFile.functions.data = sourceFile.functions.data.append(new FunctionData({functionName: data[1], lineNumber: Std.parseInt(data[0])}));

				case LineData:
					if (data.length < 2) return Failure(new Error(UnprocessableEntity, 'Invalid line data at line #$offset.'));
					if (sourceFile.lines != null) sourceFile.lines.data = sourceFile.lines.data.append(new LineData({
						checksum: data.length >= 3 ? data[2] : "",
						executionCount: Std.parseInt(data[1]),
						lineNumber: Std.parseInt(data[0])
					}));

				case SourceFile: sourceFile = new SourceFile({
					branches: new BranchCoverage(),
					functions: new FunctionCoverage(),
					lines: new LineCoverage(),
					path: data[0]
				});

				case BranchesFound: if (sourceFile.branches != null) sourceFile.branches.found = Std.parseInt(data[0]);
				case BranchesHit: if (sourceFile.branches != null) sourceFile.branches.hit = Std.parseInt(data[0]);
				case FunctionsFound: if (sourceFile.functions != null) sourceFile.functions.found = Std.parseInt(data[0]);
				case FunctionsHit: if (sourceFile.functions != null) sourceFile.functions.hit = Std.parseInt(data[0]);
				case LinesFound: if (sourceFile.lines != null) sourceFile.lines.found = Std.parseInt(data[0]);
				case LinesHit: if (sourceFile.lines != null) sourceFile.lines.hit = Std.parseInt(data[0]);
				default: return Failure(new Error(UnprocessableEntity, 'Unknown token at line #$offset.'));
			}
		}

		return report.sourceFiles.length > 0
			? Success(report)
			: Failure(new Error(UnprocessableEntity, "The coverage data is empty or invalid."));
	}

	/** Returns a string representation of this object. **/
	public function toString() {
		final lines = testName.length > 0 ? ['${Token.TestName}:$testName'] : [];
		for (sourceFile in sourceFiles.map(item -> item.toString())) lines.push(sourceFile);
		return lines.join("\n");
	}
}
