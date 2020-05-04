import lcov.*;
import utest.UTest;

/** Runs the test suites. **/
class Main {

  /** Application entry point. **/
  public static function main(): Void {
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
  }
}
