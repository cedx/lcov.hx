package lcov;

/** Provides the coverage data of a source file. **/
#if php
class Record implements php.JsonSerializable {
#else
@:expose class Record {
#end
  
  /** The branch coverage. **/
  public var branches: Null<BranchCoverage>;

  /** The function coverage. **/
  public var functions: Null<FunctionCoverage>;

  /** The line coverage. **/
  public var lines: Null<LineCoverage>;

  /** The path to the source file. **/
  public var sourceFile: String;

  /**
    Creates a new record.
    @param sourceFile The path to the source file.
    @param options An object specifying values used to initialize this instance.
  **/
  public function new(sourceFile: String, ?options: RecordOptions) {
    this.branches = options != null && options.branches != null ? options.branches : null;
    this.functions = options != null && options.functions != null ? options.functions : null;
    this.lines = options != null && options.lines != null ? options.lines : null;
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
  public function toJson() return {
    branches: branches != null ? branches.toJson() : null,
    functions: functions != null ? functions.toJson() : null,
    lines: lines != null ? lines.toJson() : null,
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

  #if js
  /** An alias for the `toJson()` method. **/
	public function toJSON() return toJson();
  #elseif php
  /** An alias for the `toJson()` method. **/
	public function jsonSerialize() return toJson();
  #end
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
