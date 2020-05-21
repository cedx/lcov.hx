import lcov.*;
import mcover.coverage.MCoverage;
import mcover.coverage.client.LcovPrintClient;
import utest.UTest;

/** Runs the test suites. **/
class TestAll {

	/** Application entry point. **/
	static function main(): Void {
		UTest.run([
			new BranchCoverageTest(),
			new BranchDataTest(),
			new FunctionCoverageTest(),
			new FunctionDataTest(),
			new LineCoverageTest(),
			new LineDataTest(),
			new RecordTest(),
			new ReportTest()
		]);

		final logger = MCoverage.getLogger();
		logger.addClient(new LcovPrintClient("lcov", "var/lcov.info"));
		logger.report();
	}
}
