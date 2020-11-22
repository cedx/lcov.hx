package lcov;

/** Tests the features of the `BranchCoverage` class. **/
class BranchCoverageTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	@:variant(new lcov.BranchCoverage(), "BRF:0\nBRH:0")
	@:variant(new lcov.BranchCoverage(23, 11, [new lcov.BranchData(127, 3, 2, 1)]), "BRDA:127,3,2,1\nBRF:23\nBRH:11")
	public function testToString(input: BranchCoverage, output: String)
		return assert(input.toString() == output);
}
