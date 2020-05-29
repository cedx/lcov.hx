package lcov;

using StringTools;

/** Represents a trace file, that is a coverage report. **/
@:expose class Report {

	/** The record list. **/
	public final records: Array<Record>;

	/** The test name. **/
	public var testName: String;

	/** Creates a new report. **/
	public function new(testName: String = "", ?records: #if php NativeIndexedArray<Record> #else Array<Record> #end) {
		this.records = records != null ? #if php cast toHaxeArray(records) #else records #end : [];
		this.testName = testName;
	}

	/**
		Parses the specified `coverage` data in [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) format.
		Throws a `LcovException` if a parsing error occurred.
	**/
	public static function fromCoverage(coverage: String): Report {
		var offset = 0;
		final report = new Report();

		try {
			var record: Record = null;
			for (line in ~/\r?\n/g.split(coverage)) {
				offset += line.length;
				line = line.trim();
				if (line.length == 0) continue;

				final parts = line.split(":");
				if (parts.length < 2 && parts[0] != Token.endOfRecord) throw new LcovException("Invalid token format.", coverage, offset);

				final token = parts.shift();
				final data = parts.join(":").split(",");

				switch (token) {
					case Token.testName: if (report.testName.length == 0) report.testName = data[0];
					case Token.endOfRecord: report.records.push(record);

					case Token.branchData:
						if (data.length < 4) throw new LcovException("Invalid branch data.", coverage, offset);
						record.branches.data.push(new BranchData(
							Std.parseInt(data[0]),
							Std.parseInt(data[1]),
							Std.parseInt(data[2]),
							data[3] == "-" ? 0 : Std.parseInt(data[3])
						));

					case Token.functionData:
						if (data.length < 2) throw new LcovException("Invalid function data.", coverage, offset);
						for (item in record.functions.data) if (item.functionName == data[1]) {
							item.executionCount = Std.parseInt(data[0]);
							break;
						}

					case Token.functionName:
						if (data.length < 2) throw new LcovException("Invalid function name.", coverage, offset);
						record.functions.data.push(new FunctionData(data[1], Std.parseInt(data[0])));

					case Token.lineData:
						if (data.length < 2) throw new LcovException("Invalid line data.", coverage, offset);
						record.lines.data.push(new LineData(
							Std.parseInt(data[0]),
							Std.parseInt(data[1]),
							data.length >= 3 ? data[2] : ""
						));

					case Token.sourceFile: record = new Record(data[0], {
						branches: new BranchCoverage(),
						functions: new FunctionCoverage(),
						lines: new LineCoverage()
					});

					case Token.branchesFound: record.branches.found = Std.parseInt(data[0]);
					case Token.branchesHit: record.branches.hit = Std.parseInt(data[0]);
					case Token.functionsFound: record.functions.found = Std.parseInt(data[0]);
					case Token.functionsHit: record.functions.hit = Std.parseInt(data[0]);
					case Token.linesFound: record.lines.found = Std.parseInt(data[0]);
					case Token.linesHit: record.lines.hit = Std.parseInt(data[0]);

					default: throw new LcovException("Unknown token.", coverage, offset);
				}
			}
		}

		catch (e: LcovException) { throw e; }
		catch (e) { throw new LcovException("The coverage data has an invalid LCOV format.", coverage, offset, e); }
		if (report.records.length == 0) throw new LcovException("The coverage data is empty.", coverage);
		return report;
	}

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final lines = testName.length > 0 ? ['${Token.testName}:$testName'] : [];
		for (record in records.map(item -> item.toString())) lines.push(record);
		return lines.join("\n");
	}
}
