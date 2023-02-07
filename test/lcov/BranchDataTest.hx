package lcov;

/** Tests the features of the `BranchData` class. **/
final class BranchDataTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	@:variant({lineNumber: 0, blockNumber: 0, branchNumber: 0}, "BRDA:0,0,0,-")
	@:variant({lineNumber: 127, blockNumber: 3, branchNumber: 2, taken: 1}, "BRDA:127,3,2,1")
	public function testToString(input, output: String)
		return assert(new BranchData(input).toString() == output);
}
