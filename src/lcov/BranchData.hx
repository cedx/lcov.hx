package lcov;

/** Provides details for branch coverage. **/
class BranchData {

  /** The block number. **/
  var blockNumber: Int;

  /** The branch number. **/
  var branchNumber: Int;

  /** The line number. **/
  var lineNumber: Int;

  /** A number indicating how often this branch was taken. **/
  var taken: Int;

  /**
    Creates a new branch data.
    @param lineNumber The line number.
    @param blockNumber The block number.
    @param branchNumber The branch number.
    @param taken A number indicating how often this branch was taken.
  **/
  public function new(lineNumber: Int, blockNumber: Int, branchNumber: Int, taken: Int = 0) {
    this.blockNumber = blockNumber;
    this.branchNumber = branchNumber;
    this.lineNumber = lineNumber;
    this.taken = taken;
  }

  /**
    Creates a new branch data from the specified JSON object.
    @param map A JSON object representing a branch data.
    @return The instance corresponding to the specified JSON object.
  **/
  public static function fromJson(map: DynamicAccess<Any>) return new BranchData(
    Std.is(map['lineNumber'], Int) ? map['lineNumber'] : 0,
    Std.is(map['blockNumber'], Int) ? map['blockNumber'] : 0,
    Std.is(map['branchNumber'], Int) ? map['branchNumber'] : 0,
    Std.is(map['taken'], Int) ? map['taken'] : 0
  );

  /**
    Converts this object to a map in JSON format.
    @return The map in JSON format corresponding to this object.
  **/
  public function toJSON() return {
    blockNumber: blockNumber,
    branchNumber: branchNumber,
    lineNumber: lineNumber,
    taken: taken
  };

  /**
    Returns a string representation of this object.
    @return The string representation of this object.
  **/
  public function toString(): String {
    final value = '${Token.branchData}:$lineNumber,$blockNumber,$branchNumber';
    return taken > 0 ? '$value,$taken' : '$value,-';
  }
}
