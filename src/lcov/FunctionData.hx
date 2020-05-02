package lcov;

/** Provides details for function coverage. **/
#if php
class FunctionData implements php.JsonSerializable {
#else
@:expose class FunctionData {
#end
  
  /** The execution count. **/
  var executionCount: Int;

  /** The function name. **/
  var functionName: String;

  /** The line number of the function start. **/
  var lineNumber: Int;

  /**
    Creates a new function data.
    @param functionName The function name.
    @param lineNumber The line number of the function start.
    @param executionCount The execution count.
  **/
  public function new(functionName: String, lineNumber: Int, executionCount: Int = 0) {
    this.executionCount = executionCount;
    this.functionName = functionName;
    this.lineNumber = lineNumber;
  }

  /**
    Creates a new function data from the specified JSON object.
    @param map A JSON object representing a function data.
    @return The instance corresponding to the specified JSON object.
  **/
  public static function fromJson(map: DynamicAccess<Any>) return new FunctionData(
    Std.is(map['functionName'], String) ? map['functionName'] : '',
    Std.is(map['lineNumber'], Int) ? map['lineNumber'] : 0,
    Std.is(map['executionCount'], Int) ? map['executionCount'] : 0
  );

  /**
    Converts this object to a map in JSON format.
    @return The map in JSON format corresponding to this object.
  **/
  public function toJSON() return {
    executionCount: executionCount,
    functionName: functionName,
    lineNumber: lineNumber
  };

  /**
    Returns a string representation of this object.
    @param asDefinition Whether to return the function definition (e.g. name and line number) instead of its data (e.g. name and execution count).
    @return The string representation of this object.
  **/
  toString(asDefinition: Bool = false): String {
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
