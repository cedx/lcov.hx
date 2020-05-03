package lcov;

/** Provides the coverage data of branches. **/
#if php
class BranchCoverage implements php.JsonSerializable {
#else
@:expose class BranchCoverage {
#end

  /** The coverage data. **/
  public var data: Array<BranchData>;

  /** The number of branches found. **/
  public var found: Int;

  /** The number of branches hit. **/
  public var hit: Int;

  /**
    Creates a new branch coverage.
    @param found The number of branches found.
    @param hit The number of branches hit.
    @param data The coverage data.
  **/
  public function new(found: Int = 0, hit: Int = 0, ?data: Array<BranchData>) {
    this.data = data != null ? data : [];
    this.found = found;
    this.hit = hit;
  }

  /**
    Creates a new branch data from the specified JSON object.
    @param map A JSON object representing a branch data.
    @return The instance corresponding to the specified JSON object.
  **/
  public static function fromJson(map: DynamicAccess<Any>) return new BranchCoverage(
    Std.is(map['found'], Int) ? map['found'] : 0,
    Std.is(map['hit'], Int) ? map['hit'] : 0,
    Std.is(map['data'], Array) ? (map['data']: Array<Any>).map(item -> BranchData.fromJson(item)) : []
  );

  /**
    Converts this object to a map in JSON format.
    @return The map in JSON format corresponding to this object.
  **/
  public function toJson() return {
    data: data.map(item -> item.toJson()),
    found: found,
    hit: hit
  };

  /**
    Returns a string representation of this object.
    @return The string representation of this object.
  **/
  public function toString(): String {
    final lines = data.map(item -> item.toString());
    lines.push('${Token.branchesFound}:$found');
    lines.push('${Token.branchesHit}:$hit');
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