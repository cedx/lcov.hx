package lcov;

using StringTools;

/** Represents a trace file, that is a coverage report. **/
@:jsonParse(json -> new lcov.Report(json))
@:jsonStringify(report -> {files: report.files, testName: report.testName})
class Report implements Model {

	/** The file list. **/
	@:editable var files: List<File> = @byDefault new List();

	/** The test name. **/
	@:editable var testName: String;

	/** Parses the specified `coverage` data in [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) format. **/
	public static function fromString(coverage: String) {
		var file = new File({path: ""});
		var offset = 0;
		final report = new Report({testName: ""});

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
				case EndOfRecord: report.files = report.files.append(file);

				case BranchData:
					if (data.length < 4) return Failure(new Error(UnprocessableEntity, 'Invalid branch data at line #$offset.'));
					if (file.branches != null) file.branches.data = file.branches.data.append(new BranchData({
						blockNumber: Std.parseInt(data[1]),
						branchNumber: Std.parseInt(data[2]),
						lineNumber: Std.parseInt(data[0]),
						taken: data[3] == "-" ? 0 : Std.parseInt(data[3])
					}));

				case FunctionData:
					if (data.length < 2) return Failure(new Error(UnprocessableEntity, 'Invalid function data at line #$offset.'));
					if (file.functions != null) for (item in file.functions.data) if (item.functionName == data[1]) {
						item.executionCount = Std.parseInt(data[0]);
						break;
					}

				case FunctionName:
					if (data.length < 2) return Failure(new Error(UnprocessableEntity, 'Invalid function name at line #$offset.'));
					if (file.functions != null)
						file.functions.data = file.functions.data.append(new FunctionData({functionName: data[1], lineNumber: Std.parseInt(data[0])}));

				case LineData:
					if (data.length < 2) return Failure(new Error(UnprocessableEntity, 'Invalid line data at line #$offset.'));
					if (file.lines != null) file.lines.data = file.lines.data.append(new LineData({
						checksum: data.length >= 3 ? data[2] : "",
						executionCount: Std.parseInt(data[1]),
						lineNumber: Std.parseInt(data[0])
					}));

				case SourceFile: file = new File({
					branches: new BranchCoverage(),
					functions: new FunctionCoverage(),
					lines: new LineCoverage(),
					path: data[0]
				});

				case BranchesFound: if (file.branches != null) file.branches.found = Std.parseInt(data[0]);
				case BranchesHit: if (file.branches != null) file.branches.hit = Std.parseInt(data[0]);
				case FunctionsFound: if (file.functions != null) file.functions.found = Std.parseInt(data[0]);
				case FunctionsHit: if (file.functions != null) file.functions.hit = Std.parseInt(data[0]);
				case LinesFound: if (file.lines != null) file.lines.found = Std.parseInt(data[0]);
				case LinesHit: if (file.lines != null) file.lines.hit = Std.parseInt(data[0]);
				default: return Failure(new Error(UnprocessableEntity, 'Unknown token at line #$offset.'));
			}
		}

		return report.files.length > 0
			? Success(report)
			: Failure(new Error(BadRequest, "The coverage data is empty or invalid."));
	}

	/** Returns a string representation of this object. **/
	public function toString() {
		final lines = testName.length > 0 ? ['${Token.TestName}:$testName'] : [];
		for (file in files.map(item -> item.toString())) lines.push(file);
		return lines.join("\n");
	}
}
