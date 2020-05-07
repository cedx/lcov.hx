package lcov;

/** Provides details for line coverage. **/
@:expose
class LineData #if php implements php.JsonSerializable #end {
  
  /** The data checksum. **/
  public var checksum: String;

  /** The execution count. **/
  public var executionCount: Int;

  /** The line number. **/
  public var lineNumber: Int;

  /** Creates a new line data. **/
  public function new(lineNumber: Int, executionCount: Int = 0, checksum: String = '') {
    this.checksum = checksum;
    this.executionCount = executionCount;
    this.lineNumber = lineNumber;
  }

  /** Creates a new line data from the specified `map` in JSON format. **/
  public static function fromJson(map: DynamicAccess<Any>) return new LineData(
    Std.is(map['lineNumber'], Int) ? map['lineNumber'] : 0,
    Std.is(map['executionCount'], Int) ? map['executionCount'] : 0,
    Std.is(map['checksum'], String) ? map['checksum'] : ''
  );

  /** Converts this object to a map in JSON format. **/
  public function toJson() return {
    checksum: checksum,
    executionCount: executionCount,
    lineNumber: lineNumber
  };

  /** Returns a string representation of this object. **/
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
