package lcov;

/** Provides the coverage data of branches. **/
@:expose
class BranchCoverage #if php implements JsonSerializable #end {

  /** The coverage data. **/
  public final data: Array<BranchData>;

  /** The number of branches found. **/
  public var found: Int;

  /** The number of branches hit. **/
  public var hit: Int;

  /** Creates a new branch coverage. **/
  public function new(found: Int = 0, hit: Int = 0, ?data: #if php NativeIndexedArray<BranchData> #else Array<BranchData> #end) {
    this.data = data != null ? #if php cast toHaxeArray(data) #else data #end : [];
    this.found = found;
    this.hit = hit;
  }

  /** Creates a new branch coverage from the specified `map` in JSON format. **/
  public static function fromJson(map: DynamicAccess<Any>) return new BranchCoverage(
    Std.is(map['found'], Int) ? map['found'] : 0,
    Std.is(map['hit'], Int) ? map['hit'] : 0,
    Std.is(map['data'], Array) ? (map['data']: Array<Any>).map(item -> BranchData.fromJson(item)) : []
  );

  /** Converts this object to a map in JSON format. **/
  public function toJson() return {
    data: #if php toPhpArray(data.map(item -> item.toJson())) #else data.map(item -> item.toJson()) #end,
    found: found,
    hit: hit
  };

  /** Returns a string representation of this object. **/
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
