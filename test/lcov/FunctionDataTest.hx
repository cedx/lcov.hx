package lcov;

/** Tests the features of the `FunctionData` class. **/
class FunctionDataTest extends Test {

	/** Tests the `toJson()` method. **/
	public function testToJson() {
		// It should return a map with default values for a newly created instance.
		var map = new FunctionData("", 0).toJson();
		Assert.equals(3, Reflect.fields(map).length);
		Assert.equals(0, map.executionCount);
		Assert.equals(0, map.functionName.length);
		Assert.equals(0, map.lineNumber);

		// It should return a non-empty map for an initialized instance.
		map = new FunctionData("main", 127, 3).toJson();
		Assert.equals(3, Reflect.fields(map).length);
		Assert.equals(3, map.executionCount);
		Assert.equals("main", map.functionName);
		Assert.equals(127, map.lineNumber);
	}

	/** Tests the `toString()` method. **/
	public function testToString() {
		// It should return a format like "FN:<lineNumber>,<functionName>" when used as definition.
		Assert.equals("FN:0,", new FunctionData("", 0).toString(true));
		Assert.equals("FN:127,main", new FunctionData("main", 127, 3).toString(true));

		// It should return a format like "FNDA:<executionCount>,<functionName>" when used as data.
		Assert.equals("FNDA:0,", new FunctionData("", 0).toString(false));
		Assert.equals("FNDA:3,main", new FunctionData("main", 127, 3).toString(false));
	}
}
