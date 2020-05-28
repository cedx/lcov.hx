package lcov;

/** Provides details for branch coverage. **/
@:expose class BranchData {

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

	/** Returns a string representation of this object. **/
	public function toString(): String {
		final value = '${Token.branchData}:$lineNumber,$blockNumber,$branchNumber';
		return taken > 0 ? '$value,$taken' : '$value,-';
	}
}
