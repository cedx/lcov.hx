package lcov;

/** Provides the coverage data of functions. **/
class FunctionCoverage {

  /** The coverage data. **/
  var data: Array<FunctionData>;

  /** The number of functions found. **/
  var found: Int;

  /** The number of functions hit. **/
  var hit: Int;

  /**
    Creates a new function coverage.
    @param found The number of functions found.
    @param hit The number of functions found.
    @param data The coverage data.
  **/
  public function new(found: Int = 0, hit: Int = 0, ?data: Array<FunctionData>) {
    this.data = data != null ? data : [];
    this.found = found;
    this.hit = hit;
  }

  /**
    Creates a new function coverage from the specified JSON object.
    @param map A JSON object representing a function coverage.
    @return The instance corresponding to the specified JSON object.
  **/
  public static function fromJson(map: DynamicAccess<Any>) return new FunctionCoverage(
    Std.is(map['found'], Int) ? map['found'] : 0,
    Std.is(map['hit'], Int) ? map['hit'] : 0,
    Std.is(map['data'], Array) ? (map['data']: Array<Any>).map(item -> FunctionData.fromJson(item)) : []
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
    final lines = data.map(item -> item.toString(true));
    for (line in data.map(item -> item.toString(false))) lines.push(line);
    lines.push('${Token.functionsFound}:$found');
    lines.push('${Token.functionsHit}:$hit');
    return lines.join('\n');
  }
}
