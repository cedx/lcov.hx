package lcov;

/** Provides details for function coverage. **/
@:expose
class FunctionData #if php implements php.JsonSerializable #end {
  
  /** The execution count. **/
  public var executionCount: Int;

  /** The function name. **/
  public var functionName: String;

  /** The line number of the function start. **/
  public var lineNumber: Int;

  /** Creates a new function data. **/
  public function new(functionName: String, lineNumber: Int, executionCount: Int = 0) {
    this.executionCount = executionCount;
    this.functionName = functionName;
    this.lineNumber = lineNumber;
  }

  /** Creates a new function data from the specified `map` in JSON format. **/
  public static function fromJson(map: DynamicAccess<Any>) return new FunctionData(
    Std.is(map['functionName'], String) ? map['functionName'] : '',
    Std.is(map['lineNumber'], Int) ? map['lineNumber'] : 0,
    Std.is(map['executionCount'], Int) ? map['executionCount'] : 0
  );

  /** Converts this object to a map in JSON format. **/
  public function toJson() return {
    executionCount: executionCount,
    functionName: functionName,
    lineNumber: lineNumber
  };

  /** Returns a string representation of this object. **/
  public function toString(asDefinition: Bool = false): String {
    final token = asDefinition ? Token.functionName : Token.functionData;
    final count = asDefinition ? lineNumber : executionCount;
    return '$token:$count,$functionName';
  }

  #if js
  /** An alias for the `toJson()` method. **/
	public function toJSON() return toJson();
  #elseif php
  /** An alias for the `toJson()` method. **/
	public function jsonSerialize() return toJson();
  #end
}
