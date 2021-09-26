import instrument.coverage.Coverage;
import tink.testrunner.Runner;
import tink.unit.TestBatch;

/** Runs the test suite. **/
function main() {
	final tests = TestBatch.make([
		new lcov.BranchCoverageTest(),
		new lcov.BranchDataTest(),
		new lcov.FunctionCoverageTest(),
		new lcov.FunctionDataTest(),
		new lcov.LineCoverageTest(),
		new lcov.LineDataTest(),
		new lcov.RecordTest(),
		new lcov.ReportTest()
	]);

	Runner.run(tests).handle(outcome -> {
		Coverage.endCoverage();
		Runner.exit(outcome);
	});
}
