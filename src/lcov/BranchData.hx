package lcov;

/** Provides details for branch coverage. **/
@:expose
class BranchData #if php implements JsonSerializable #end {
  
  /** The block number. **/
  public var blockNumber: Int;

  /** The branch number. **/
  public var branchNumber: Int;

  /** The line number. **/
  public var lineNumber: Int;

  /** A number indicating how often this branch was taken. **/
  public var taken: Int;

  /** Creates a new branch data. **/
  public function new(lineNumber: Int, blockNumber: Int, branchNumber: Int, taken: Int = 0) {
    this.blockNumber = blockNumber;
    this.branchNumber = branchNumber;
    this.lineNumber = lineNumber;
    this.taken = taken;
  }

  /** Creates a new branch data from the specified `map` in JSON format. **/
  public static function fromJson(map: DynamicAccess<Any>) return new BranchData(
    Std.is(map['lineNumber'], Int) ? map['lineNumber'] : 0,
    Std.is(map['blockNumber'], Int) ? map['blockNumber'] : 0,
    Std.is(map['branchNumber'], Int) ? map['branchNumber'] : 0,
    Std.is(map['taken'], Int) ? map['taken'] : 0
  );

  /** Converts this object to a map in JSON format. **/
  public function toJson() return {
    blockNumber: blockNumber,
    branchNumber: branchNumber,
    lineNumber: lineNumber,
    taken: taken
  };

  /** Returns a string representation of this object. **/
  public function toString(): String {
    final value = '${Token.branchData}:$lineNumber,$blockNumber,$branchNumber';
    return taken > 0 ? '$value,$taken' : '$value,-';
  }

  #if js
  /** An alias for the `toJson()` method. **/
	public function toJSON() return toJson();
  #elseif php
  /** An alias for the `toJson()` method. **/
	public function jsonSerialize() return toJson();
  #end
}
