import instrument.coverage.Coverage;
import lcov.*;
import tink.testrunner.Runner;
import tink.unit.TestBatch;

/** Application entry point. **/
function main() {
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
