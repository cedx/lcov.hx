package lcov;

/** Tests the features of the `LineCoverage` class. **/
@:asserts class LineCoverageTest {

	/** Creates a new test suite. **/
	public function new() {}

	/** Tests the `toString()` method. **/
	public function testToString() {
		// It should return a format like "LF:<found>\nLH:<hit>".
		final data = new LineData(127, 3);
		asserts.assert(new LineCoverage().toString() == "LF:0\nLH:0");
		asserts.assert(new LineCoverage(23, 11, [data]).toString() == '$data\nLF:23\nLH:11');
		return asserts.done();
	}
}
