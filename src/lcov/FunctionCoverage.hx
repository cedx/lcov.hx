package lcov;

/** Provides the coverage data of functions. **/
@:expose
class FunctionCoverage #if php implements JsonSerializable #end {
  
  /** The coverage data. **/
  public var data(default, null): Array<FunctionData>;

  /** The number of functions found. **/
  public var found: Int;

  /** The number of functions hit. **/
  public var hit: Int;

  /** Creates a new function coverage. **/
  public function new(found: Int = 0, hit: Int = 0, ?data: #if php NativeIndexedArray<FunctionData> #else Array<FunctionData> #end) {
    this.data = data != null ? #if php cast toHaxeArray(data) #else data #end : [];
    this.found = found;
    this.hit = hit;
  }

  /** Creates a new function coverage from the specified `map` in JSON format. **/
  public static function fromJson(map: DynamicAccess<Any>) return new FunctionCoverage(
    Std.is(map['found'], Int) ? map['found'] : 0,
    Std.is(map['hit'], Int) ? map['hit'] : 0,
    Std.is(map['data'], Array) ? (map['data']: Array<Any>).map(item -> FunctionData.fromJson(item)) : []
  );

  /** Converts this object to a map in JSON format. **/
  public function toJson() return {
    data: #if php toPhpArray(data.map(item -> item.toJson())) #else data.map(item -> item.toJson()) #end,
    found: found,
    hit: hit
  };

  /** Returns a string representation of this object. **/
  public function toString(): String {
    final lines = data.map(item -> item.toString(true));
    for (line in data.map(item -> item.toString(false))) lines.push(line);
    lines.push('${Token.functionsFound}:$found');
    lines.push('${Token.functionsHit}:$hit');
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
