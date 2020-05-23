import lcov.*;
import mcover.coverage.MCoverage;
import mcover.coverage.client.LcovPrintClient;
import tink.testrunner.Runner;
import tink.unit.TestBatch;

/** Runs the test suites. **/
class RunTests {

	/** Application entry point. **/
	static function main(): Void {
		final tests = TestBatch.make([
			new BranchCoverageTest(),
			new BranchDataTest(),
			new FunctionCoverageTest(),
			new FunctionDataTest(),
			new LineCoverageTest(),
			new LineDataTest(),
			new RecordTest(),
			new ReportTest()
		]);

		Runner.run(tests).handle(result -> {
			final logger = MCoverage.getLogger();
			logger.addClient(new LcovPrintClient("lcov", "var/lcov.info"));
			logger.report();
			Runner.exit(result);
		});
	}
}
