package lcov;

/** Provides the coverage data of a source file. **/
class Record {

  /** The branch coverage. **/
  var branches: Null<BranchCoverage>;

  /** The function coverage. **/
  var functions: Null<FunctionCoverage>;

  /** The line coverage. **/
  var lines: Null<LineCoverage>;

  /** The path to the source file. **/
  var sourceFile: String;

  /**
    Creates a new record.
    @param sourceFile The path to the source file.
    @param options An object specifying values used to initialize this instance.
  **/
  public function new(sourceFile: String, options: RecordOptions = {}) {
    this.branches = options.branches != null ? branches : null;
    this.functions = options.functions != null ? functions : null;
    this.lines = options.lines != null ? lines : null;
    this.sourceFile = sourceFile;
  }

  /**
    Creates a new record from the specified JSON object.
    @param map A JSON object representing a record.
    @return The instance corresponding to the specified JSON object.
  **/
  public static function fromJson(map: DynamicAccess<Any>) return new Record(Std.is(map['sourceFile'], String) ? map['sourceFile'] : '', {
    branches: Reflect.isObject(map['branches']) ? BranchCoverage.fromJson(map['branches']) : null,
    functions: Reflect.isObject(map['functions']) ? FunctionCoverage.fromJson(map['functions']) : null,
    lines: Reflect.isObject(map['lines']) ? LineCoverage.fromJson(map['lines']) : null
  });

  /**
    Converts this object to a map in JSON format.
    @return The map in JSON format corresponding to this object.
  **/
  public function toJSON() return {
    branches: branches != null ? branches.toJSON() : null,
    functions: functions != null ? functions.toJSON() : null,
    lines: lines != null ? lines.toJSON() : null,
    sourceFile: sourceFile
  };

  /**
    Returns a string representation of this object.
    @return The string representation of this object.
  **/
  public function toString(): String {
    final output = ['${Token.sourceFile}:$sourceFile'];
    if (functions != null) output.push(functions.toString());
    if (branches != null) output.push(branches.toString());
    if (lines != null) output.push(lines.toString());
    output.push(Token.endOfRecord);
    return output.join('\n');
  }
}

/** Defines the options of a `Record` instance. */
typedef RecordOptions = {

  /** The branch coverage. */
  var ?branches: BranchCoverage;

  /** The function coverage. */
  var ?functions: FunctionCoverage;

  /** The line coverage. */
  var ?lines: LineCoverage;
}
