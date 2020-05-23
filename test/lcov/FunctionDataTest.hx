package lcov;

/** Tests the features of the `FunctionData` class. **/
@:asserts class FunctionDataTest {

	/** Creates a new test suite. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	public function testToString() {
		// It should return a format like "FN:<lineNumber>,<functionName>" when used as definition.
		asserts.assert(new FunctionData("", 0).toString(true) == "FN:0,");
		asserts.assert(new FunctionData("main", 127, 3).toString(true) == "FN:127,main");

		// It should return a format like "FNDA:<executionCount>,<functionName>" when used as data.
		asserts.assert(new FunctionData("", 0).toString(false) == "FNDA:0,");
		asserts.assert(new FunctionData("main", 127, 3).toString(false) == "FNDA:3,main");

		return asserts.done();
	}
}
