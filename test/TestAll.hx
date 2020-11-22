import instrument.coverage.Coverage;
import lcov.*;
import tink.testrunner.Runner;
import tink.unit.TestBatch;

/** Runs the test suite. **/
class TestAll {

	/** Application entry point. **/
	static function main() {
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

		Runner.run(tests).handle(outcome -> {
			Coverage.endCoverage();
			Runner.exit(outcome);
		});
	}
}
