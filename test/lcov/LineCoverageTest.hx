package lcov;

/** Tests the features of the `LineCoverage` class. **/
class LineCoverageTest extends Test {

	/** Tests the `toString()` method. **/
	function testToString(): Void {
		// It should return a format like "LF:<found>\nLH:<hit>".
		final data = new LineData(127, 3);
		Assert.equals("LF:0\nLH:0", new LineCoverage().toString());
		Assert.equals('$data\nLF:23\nLH:11', new LineCoverage(23, 11, [data]).toString());
	}
}
