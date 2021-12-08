package lcov;

using StringTools;

/** Represents a trace file, that is a coverage report. **/
#if tink_json
@:jsonParse(json -> new lcov.Report(json))
@:jsonStringify(report -> {records: report.records, testName: report.testName})
#end
class Report implements Model {

	/** The record list. **/
	@:editable var records: List<Record> = @byDefault [];

	/** The test name. **/
	@:editable var testName: String = @byDefault "";

	/** Parses the specified `coverage` data in [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) format. **/
	public static function fromString(coverage: String) {
		var offset = 0;
		var record: Record = null;
		final report = new Report();

		for (line in ~/\r?\n/g.split(coverage)) {
			offset += line.length;
			line = line.trim();
			if (line.length == 0) continue;

			final parts = line.split(":");
			if (parts.length < 2 && parts[0] != Token.EndOfRecord)
				return Failure(Error.withData(UnprocessableEntity, "Invalid token format.", offset));

			final token: Token = parts.shift();
			final data = parts.join(":").split(",");

			switch token {
				case TestName: if (report.testName.length == 0) report.testName = data[0];
				case EndOfRecord: report.records = report.records.append(record);

				case BranchData:
					if (data.length < 4) return Failure(Error.withData(UnprocessableEntity, "Invalid branch data.", offset));
					record.branches.data = record.branches.data.append(new BranchData({
						lineNumber: Std.parseInt(data[0]),
						blockNumber: Std.parseInt(data[1]),
						branchNumber: Std.parseInt(data[2]),
						taken: data[3] == "-" ? 0 : Std.parseInt(data[3])
					}));

				case FunctionData:
					if (data.length < 2) return Failure(Error.withData(UnprocessableEntity, "Invalid function data.", offset));
					for (item in record.functions.data) if (item.functionName == data[1]) {
						item.executionCount = Std.parseInt(data[0]);
						break;
					}

				case FunctionName:
					if (data.length < 2) return Failure(Error.withData(UnprocessableEntity, "Invalid function name.", offset));
					record.functions.data = record.functions.data.append(new FunctionData({functionName: data[1], lineNumber: Std.parseInt(data[0])}));

				case LineData:
					if (data.length < 2) return Failure(Error.withData(UnprocessableEntity, "Invalid line data.", offset));
					record.lines.data = record.lines.data.append(new LineData({
						lineNumber: Std.parseInt(data[0]),
						executionCount: Std.parseInt(data[1]),
						checksum: data.length >= 3 ? data[2] : ""
					}));

				case SourceFile: record = new Record({
					sourceFile: data[0],
					branches: new BranchCoverage(),
					functions: new FunctionCoverage(),
					lines: new LineCoverage()
				});

				case BranchesFound: record.branches.found = Std.parseInt(data[0]);
				case BranchesHit: record.branches.hit = Std.parseInt(data[0]);
				case FunctionsFound: record.functions.found = Std.parseInt(data[0]);
				case FunctionsHit: record.functions.hit = Std.parseInt(data[0]);
				case LinesFound: record.lines.found = Std.parseInt(data[0]);
				case LinesHit: record.lines.hit = Std.parseInt(data[0]);

				default: return Failure(Error.withData(UnprocessableEntity, "Unknown token.", offset));
			}
		}

		return report.records.length > 0
			? Success(report)
			: Failure(Error.withData(BadRequest, "The coverage data is empty or invalid.", offset));
	}

	/** Returns a string representation of this object. **/
	public function toString() {
		final lines = testName.length > 0 ? ['${Token.TestName}:$testName'] : [];
		for (record in records.map(item -> item.toString())) lines.push(record);
		return lines.join("\n");
	}
}
