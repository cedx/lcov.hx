package lcov;

/** Tests the features of the `BranchCoverage` class. **/
final class BranchCoverageTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	@:variant({}, "BRF:0\nBRH:0")
	@:variant({found: 23, hit: 11, data: [new lcov.BranchData({lineNumber: 127, blockNumber: 3, branchNumber: 2, taken: 1})]}, "BRDA:127,3,2,1\nBRF:23\nBRH:11")
	public function toString(input, output: String)
		return assert(new BranchCoverage(input).toString() == output);
}
