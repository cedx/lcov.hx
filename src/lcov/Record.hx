package lcov;

/** Provides the coverage data of a source file. **/
@:expose
class Record #if php implements php.JsonSerializable #end {
  
  /** The branch coverage. **/
  public var branches: Null<BranchCoverage> = null;

  /** The function coverage. **/
  public var functions: Null<FunctionCoverage> = null;

  /** The line coverage. **/
  public var lines: Null<LineCoverage> = null;

  /** The path to the source file. **/
  public var sourceFile: String;

  /**
    Creates a new record.
    @param sourceFile The path to the source file.
    @param options An object specifying values used to initialize this instance.
  **/
  public function new(sourceFile: String, ?options: RecordOptions) {
    this.sourceFile = sourceFile;
    if (options != null) {
      if (#if php php.Global.isset(options.branches) #else options.branches != null #end) this.branches = options.branches;
      if (#if php php.Global.isset(options.functions) #else options.functions != null #end) this.functions = options.functions;
      if (#if php php.Global.isset(options.lines) #else options.lines != null #end) this.lines = options.lines;
    }
  }

  /** Creates a new record from the specified `map` in JSON format. **/
  public static function fromJson(map: DynamicAccess<Any>) return new Record(Std.is(map['sourceFile'], String) ? map['sourceFile'] : '', {
    branches: Reflect.isObject(map['branches']) ? BranchCoverage.fromJson(map['branches']) : null,
    functions: Reflect.isObject(map['functions']) ? FunctionCoverage.fromJson(map['functions']) : null,
    lines: Reflect.isObject(map['lines']) ? LineCoverage.fromJson(map['lines']) : null
  });

  /** Converts this object to a map in JSON format. **/
  public function toJson() return {
    branches: branches != null ? branches.toJson() : null,
    functions: functions != null ? functions.toJson() : null,
    lines: lines != null ? lines.toJson() : null,
    sourceFile: sourceFile
  };

  /** Returns a string representation of this object. **/
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
