package lcov;

using StringTools;

/** Represents a trace file, that is a coverage report. **/
class Report {

	/** The record list. **/
	public final records: Array<Record>;

	/** The test name. **/
	public var testName: String;

	/** Creates a new report. **/
	public function new(testName = "", ?records: Array<Record>) {
		this.records = records != null ? records : [];
		this.testName = testName;
	}

	/**
		Parses the specified `coverage` data in [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) format.
		Throws a `LcovException` if a parsing error occurred.
	**/
	public static function fromCoverage(coverage: String) {
		var offset = 0;
		var record: Record = null;
		final report = new Report();

		for (line in ~/\r?\n/g.split(coverage)) {
			offset += line.length;
			line = line.trim();
			if (line.length == 0) continue;

			final parts = line.split(":");
			if (parts.length < 2 && parts[0] != Token.EndOfRecord) throw new LcovException("Invalid token format.", coverage, offset);

			final token: Token = parts.shift();
			final data = parts.join(":").split(",");

			switch token {
				case TestName: if (report.testName.length == 0) report.testName = data[0];
				case EndOfRecord: report.records.push(record);

				case BranchData:
					if (data.length < 4) throw new LcovException("Invalid branch data.", coverage, offset);
					record.branches.data.push({
						lineNumber: Std.parseInt(data[0]),
						blockNumber: Std.parseInt(data[1]),
						branchNumber: Std.parseInt(data[2]),
						taken: data[3] == "-" ? 0 : Std.parseInt(data[3])
					});

				case FunctionData:
					if (data.length < 2) throw new LcovException("Invalid function data.", coverage, offset);
					for (item in record.functions.data) if (item.functionName == data[1]) {
						item.executionCount = Std.parseInt(data[0]);
						break;
					}

				case FunctionName:
					if (data.length < 2) throw new LcovException("Invalid function name.", coverage, offset);
					record.functions.data.push({functionName: data[1], lineNumber: Std.parseInt(data[0])});

				case LineData:
					if (data.length < 2) throw new LcovException("Invalid line data.", coverage, offset);
					record.lines.data.push({
						lineNumber: Std.parseInt(data[0]),
						executionCount: Std.parseInt(data[1]),
						checksum: data.length >= 3 ? data[2] : ""
					});

				case SourceFile: record = new Record(data[0], {
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

				default: throw new LcovException("Unknown token.", coverage, offset);
			}
		}

		if (report.records.length == 0) throw new LcovException("The coverage data is empty or invalid.", coverage);
		return report;
	}

	/** Returns a string representation of this object. **/
	public function toString() {
		final lines = testName.length > 0 ? ['${Token.TestName}:$testName'] : [];
		for (record in records.map(item -> item.toString())) lines.push(record);
		return lines.join("\n");
	}
}
