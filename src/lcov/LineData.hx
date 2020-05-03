package lcov;

/** Provides details for line coverage. **/
#if php
class LineData implements php.JsonSerializable {
#else
@:expose class LineData {
#end
  
  /** The data checksum. **/
  public var checksum: String;

  /** The execution count. **/
  public var executionCount: Int;

  /** The line number. **/
  public var lineNumber: Int;

  /**
    Creates a new line data.
    @param lineNumber The line number.
    @param executionCount The execution count.
    @param checksum The data checksum.
  **/
  public function new(lineNumber: Int, executionCount: Int = 0, checksum: String = '') {
    this.checksum = checksum;
    this.executionCount = executionCount;
    this.lineNumber = lineNumber;
  }

  /**
    Creates a new line data from the specified JSON object.
    @param map A JSON object representing a line data.
    @return The instance corresponding to the specified JSON object.
  **/
  public static function fromJson(map: DynamicAccess<Any>) return new LineData(
    Std.is(map['lineNumber'], Int) ? map['lineNumber'] : 0,
    Std.is(map['executionCount'], Int) ? map['executionCount'] : 0,
    Std.is(map['checksum'], String) ? map['checksum'] : ''
  );

  /**
    Converts this object to a map in JSON format.
    @return The map in JSON format corresponding to this object.
  **/
  public function toJson() return {
    checksum: checksum,
    executionCount: executionCount,
    lineNumber: lineNumber
  };

  /**
    Returns a string representation of this object.
    @return The string representation of this object.
  **/
  public function toString(): String {
    final value = '${Token.lineData}:$lineNumber,$executionCount';
    return checksum.length > 0 ? '$value,$checksum' : value;
  }

  #if js
  /** An alias for the `toJson()` method. **/
	public function toJSON() return toJson();
  #elseif php
  /** An alias for the `toJson()` method. **/
	public function jsonSerialize() return toJson();
  #end
}