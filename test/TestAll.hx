import lcov.*;
import mcover.coverage.MCoverage;
import mcover.coverage.client.LcovPrintClient;
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
	static function main() UTest.run(tests, () -> {
		final logger = MCoverage.getLogger();
		logger.addClient(new LcovPrintClient("which", "var/lcov.info"));
		logger.report();
	});
}
