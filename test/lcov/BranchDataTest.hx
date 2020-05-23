package lcov;

/** Tests the features of the `BranchData` class. **/
@:asserts class BranchDataTest {

	/** Creates a new test suite. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	public function testToString() {
		// It should return a format like "BRDA:<lineNumber>,<blockNumber>,<branchNumber>,<taken>".
		asserts.assert(new BranchData(0, 0, 0).toString() == "BRDA:0,0,0,-");
		asserts.assert(new BranchData(127, 3, 2, 1).toString() == "BRDA:127,3,2,1");
		return asserts.done();
	}
}
