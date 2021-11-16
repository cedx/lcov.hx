import instrument.coverage.Coverage;
import tink.testrunner.Runner;
import tink.unit.TestBatch;

#if (js && !nodejs)
import js.Syntax;
#end

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

	Runner.run(tests).handle(result -> {
		Coverage.endCoverage();
		#if (js && !nodejs) Syntax.code("exit({0})", result.summary().failures.length) #else Runner.exit(result) #end;
	});
}
