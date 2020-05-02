package lcov;

/** Provides the coverage data of lines. **/
#if php
class LineCoverage implements php.JsonSerializable {
#else
@:expose class LineCoverage {
#end

  /** The coverage data. **/
  var data: Array<LineData>;

  /** The number of lines found. **/
  var found: Int;

  /** The number of lines hit. **/
  var hit: Int;

  /**
    Creates a new line coverage.
    @param found The number of lines found.
    @param hit The number of lines found.
    @param data The coverage data.
  **/
  public function new(found: Int = 0, hit: Int = 0, ?data: Array<LineData>) {
    this.data = data != null ? data : [];
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
  public function toJSON() return {
    data: data.map(item -> item.toJSON()),
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
}
