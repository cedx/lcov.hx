package lcov;

/** Represents a trace file, that is a coverage report. **/
class Report {

  /** The record list. **/
  var records: Array<Record>;

  /** The test name. **/
  var testName: String;

  /**
    Creates a new report.
    @param testName The test name.
    @param records The record list.
  **/
  public function new(testName: String = '', ?records: Array<Record>) {
    this.records = records != null ? records : [];
    this.testName = testName;
  }

  /**
    Parses the specified coverage data in [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) format.
    @param coverage The coverage data.
    @return The resulting coverage report.
    @throws `LcovException` A parsing error occurred.
  **/
  public static function fromCoverage(coverage: String): Report {
    final report = new Report();

    try {
      var record: Record;
      for (line in coverage.split(~/\r?\n/g)) {
        line = line.trim();
        if (line.length == 0) continue;

        final parts = line.split(':');
        if (parts.length < 2 && parts[0] != Token.endOfRecord) throw new LcovException('Invalid token format');

        final token = parts.shift();
        final data = parts.join(':').split(',');

        switch (token) {
          case Token.testName:
            report.testName = data[0];
            break;

          case Token.sourceFile:
            record = new Record(data[0], {
              branches: new BranchCoverage(),
              functions: new FunctionCoverage(),
              lines: new LineCoverage()
            });
            break;

          case Token.functionName:
            if (data.length < 2) throw new LcovException('Invalid function name');
            record.functions.data.push(new FunctionData(data[1], Std.parseInt(data[0])));
            break;

          case Token.functionData:
            if (data.length < 2) throw new LcovException('Invalid function data');
            record.functions.data.some(item -> {
              if (item.functionName != data[1]) return false;
              item.executionCount = Std.parseInt(data[0]);
              return true;
            });
            break;

          case Token.functionsFound:
            record.functions.found = Std.parseInt(data[0]);
            break;

          case Token.functionsHit:
            record.functions.hit = Std.parseInt(data[0]);
            break;

          case Token.branchData:
            if (data.length < 4) throw new LcovException('Invalid branch data');
            record.branches.data.push(new BranchData(
              Std.parseInt(data[0]),
              Std.parseInt(data[1]),
              Std.parseInt(data[2]),
              data[3] == '-' ? 0 : Std.parseInt(data[3])
            ));
            break;

          case Token.branchesFound:
            record.branches.found = Std.parseInt(data[0]);
            break;

          case Token.branchesHit:
            record.branches.hit = Std.parseInt(data[0]);
            break;

          case Token.lineData:
            if (data.length < 2) throw new LcovException('Invalid line data');
            record.lines.data.push(new LineData(
              Std.parseInt(data[0]),
              Std.parseInt(data[1]),
              data.length >= 3 ? data[2] : ''
            ));
            break;

          case Token.linesFound:
            record.lines.found = Std.parseInt(data[0]);
            break;

          case Token.linesHit:
            record.lines.hit = Std.parseInt(data[0]);
            break;

          case Token.endOfRecord:
            report.records.push(record);
            break;
        }
      }
    }

    catch (e: Any) {
      throw new LcovException('The coverage data has an invalid LCOV format', coverage);
    }

    if (report.records.length == 0) throw new LcovException('The coverage data is empty', coverage);
    return report;
  }

  /**
    Creates a new report from the specified JSON object.
    @param map A JSON object representing a report.
    @return The instance corresponding to the specified JSON object.
  **/
  public static function fromJson(map: DynamicAccess<Any>) return new Report(
    Std.is(map['testName'], String) ? map['testName'] : '',
    Std.is(map['records'], Array) ? (map['records']: Array<Any>).map(item -> Record.fromJson(item)) : []
  );

  /**
    Converts this object to a map in JSON format.
    @return The map in JSON format corresponding to this object.
  **/
  public function toJSON() return {
    records: records.map(item -> item.toJSON()),
    testName: testName
  };

  /**
    Returns a string representation of this object.
    @return The string representation of this object.
  **/
  public function toString(): String {
    final lines = testName.length > 0 ? ['${Token.testName}:$testName'] : [];
    for (record in records.map(item -> item.toString())) lines.push(record);
    return lines.join('\n');
  }
}
