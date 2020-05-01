package lcov;

import haxe.DynamicAccess;

/** Provides the coverage data of branches. **/
class BranchCoverage {

  /** The coverage data. **/
  var data: Array<BranchData>;

  /** The number of branches found. **/
  var found: Int;

  /** The number of branches hit. **/
  var hit: Int;

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
  public static function fromJson(map: DynamicAccess<Dynamic>) return new BranchCoverage(
    Std.is(map['found'], Int) ? map['found'] : 0,
    Std.is(map['hit'], Int) ? map['hit'] : 0,
    Std.is(map['data'], Array) ? map['data'].map(item -> BranchData.fromJson(item)) : []
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
    lines.push('${Token.branchesFound}:$found');
    lines.push('${Token.branchesHit}:$hit');
    return lines.join('\n');
  }
}
