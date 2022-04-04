package lcov;

/** Provides details for branch coverage. **/
@:jsonParse(json -> new lcov.BranchData(json))
@:jsonStringify(data -> {
	blockNumber: data.blockNumber,
	branchNumber: data.branchNumber,
	lineNumber: data.lineNumber,
	taken: data.taken
})
class BranchData implements Model {

	/** The block number. **/
	@:editable var blockNumber: Int;

	/** The branch number. **/
	@:editable var branchNumber: Int;

	/** The line number. **/
	@:editable var lineNumber: Int;

	/** A number indicating how often this branch was taken. **/
	@:editable var taken: Int = @byDefault 0;

	/** Returns a string representation of this object. **/
	public function toString() {
		final value = '${Token.BranchData}:$lineNumber,$blockNumber,$branchNumber';
		return taken > 0 ? '$value,$taken' : '$value,-';
	}
}
