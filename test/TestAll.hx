import instrument.coverage.Coverage;
import lcov.*;
import utest.UTest;

/** Runs the test suite. **/
class TestAll {

	/** The test cases. **/
	static final tests = [
		new BranchCoverageTest(),
		new BranchDataTest(),
		new FunctionCoverageTest(),
		new FunctionDataTest(),
		new LineCoverageTest(),
		new LineDataTest(),
		new RecordTest(),
		new ReportTest()
	];

	/** Application entry point. **/
	static function main() UTest.run(tests, Coverage.endCoverage);
}
