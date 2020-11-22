package lcov;

/** Tests the features of the `BranchData` class. **/
class BranchDataTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	@:variant(new lcov.BranchData(0, 0, 0), "BRDA:0,0,0,-")
	@:variant(new lcov.BranchData(127, 3, 2, 1), "BRDA:127,3,2,1")
	public function testToString(input: BranchData, output: String)
		return assert(input.toString() == output);
}
