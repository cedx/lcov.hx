package lcov;

/** Provides the coverage data of lines. **/
@:expose
class LineCoverage #if php implements php.JsonSerializable #end {

  /** The coverage data. **/
  public var data: Array<LineData>;

  /** The number of lines found. **/
  public var found: Int;

  /** The number of lines hit. **/
  public var hit: Int;

  /**
    Creates a new line coverage.
    @param found The number of lines found.
    @param hit The number of lines found.
    @param data The coverage data.
  **/
  public function new(found: Int = 0, hit: Int = 0, ?data: #if php php.NativeIndexedArray<LineData> #else Array<LineData> #end) {
    this.data = data != null ? #if php cast php.Lib.toHaxeArray(data) #else data #end : [];
    this.found = found;
    this.hit = hit;
  }

  /**
    Creates a new line coverage from the specified JSON object.
    @param map A JSON object representing a line coverage.
    @return The instance corresponding to the specified JSON object.
  **/
  public static function fromJson(map: DynamicAccess<Any>) return new LineCoverage(
    Std.is(map['found'], Int) ? map['found'] : 0,
    Std.is(map['hit'], Int) ? map['hit'] : 0,
    Std.is(map['data'], Array) ? (map['data']: Array<Any>).map(item -> LineData.fromJson(item)) : []
  );

  /**
    Converts this object to a map in JSON format.
    @return The map in JSON format corresponding to this object.
  **/
  public function toJson() return {
    data: #if php php.Lib.toPhpArray(data.map(item -> item.toJson())) #else data.map(item -> item.toJson()) #end,
    found: found,
    hit: hit
  };

  /**
    Returns a string representation of this object.
    @return The string representation of this object.
  **/
  public function toString(): String {
    final lines = data.map(item -> item.toString());
    lines.push('${Token.linesFound}:$found');
    lines.push('${Token.linesHit}:$hit');
    return lines.join('\n');
  }

  #if js
  /** An alias for the `toJson()` method. **/
	public function toJSON() return toJson();
  #elseif php
  /** An alias for the `toJson()` method. **/
	public function jsonSerialize() return toJson();
  #end
}
