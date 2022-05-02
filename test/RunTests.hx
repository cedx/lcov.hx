import instrument.coverage.Coverage;
import tink.testrunner.Reporter.AnsiFormatter;
import tink.testrunner.Reporter.BasicReporter;
import tink.testrunner.Runner;
import tink.unit.TestBatch;

/** Runs the test suite. **/
function main() {
	final tests = TestBatch.make([
		new lcov.BranchCoverageTest(),
		new lcov.BranchDataTest(),
		new lcov.FileTest(),
		new lcov.FunctionCoverageTest(),
		new lcov.FunctionDataTest(),
		new lcov.LineCoverageTest(),
		new lcov.LineDataTest(),
		new lcov.ReportTest()
	]);

	ANSI.stripIfUnavailable = false;
	Runner.run(tests, new BasicReporter(new AnsiFormatter())).handle(outcome -> {
		Coverage.endCoverage();
		Runner.exit(outcome);
	});
}
