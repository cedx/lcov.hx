package lcov;

/** Tests the features of the `FunctionData` class. **/
@:asserts class FunctionDataTest {

	/** Creates a new test. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	@:variant(new lcov.FunctionData("", 0), "FNDA:0,", "FN:0,")
	@:variant(new lcov.FunctionData("main", 127, 3), "FNDA:3,main", "FN:127,main")
	public function testToString(input: FunctionData, asData: String, asDefinition: String) {
		asserts.assert(input.toString(false) == asData);
		asserts.assert(input.toString(true) == asDefinition);
		return asserts.done();
	}
}
