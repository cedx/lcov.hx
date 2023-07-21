package lcov;

/** Tests the features of the `FunctionData` class. **/
@:asserts final class FunctionDataTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	@:variant({functionName: "", lineNumber: 0}, "FNDA:0,", "FN:0,")
	@:variant({functionName: "main", lineNumber: 127, executionCount: 3}, "FNDA:3,main", "FN:127,main")
	public function toString(input, asData: String, asDefinition: String) {
		final data = new FunctionData(input);
		asserts.assert(data.toString(false) == asData);
		asserts.assert(data.toString(true) == asDefinition);
		return asserts.done();
	}
}
