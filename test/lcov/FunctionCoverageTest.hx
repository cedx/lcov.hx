package lcov;

/** Tests the features of the `FunctionCoverage` class. **/
class FunctionCoverageTest extends Test {

  /** Tests the `fromJson()` method. **/
  public function testFromJson() {
    // It should return an instance with default values for an empty map.
    final coverage = FunctionCoverage.fromJson({});
    Assert.equals(0, coverage.data.length);
    Assert.equals(0, coverage.found);
    Assert.equals(0, coverage.hit);

    // It should return an initialized instance for a non-empty map.
    final coverage = FunctionCoverage.fromJson({
      data: [{lineNumber: 127}],
      found: 23,
      hit: 11
    });

    Assert.equals(1, coverage.data.length);
    Assert.is(coverage.data[0], FunctionData);
    Assert.equals(127, coverage.data[0].lineNumber);
    Assert.equals(23, coverage.found);
    Assert.equals(11, coverage.hit);
  }

  /** Tests the `toJson()` method. **/
  public function testToJson() {
    // It should return a map with default values for a newly created instance.
    final map = new FunctionCoverage().toJson();
    Assert.equals(3, Reflect.fields(map).length);

    Assert.is(map.data, Array);
    Assert.equals(0, map.data.length);
    Assert.equals(0, map.found);
    Assert.equals(0, map.hit);

    // It should return a non-empty map for an initialized instance.
    final map = new FunctionCoverage(23, 11, [new FunctionData('', 0)]).toJson();
    Assert.equals(3, Reflect.fields(map).length);
    Assert.is(map.data, Array);
    Assert.equals(1, map.data.length);

    Assert.isTrue(Reflect.isObject(map.data[0]));
    Assert.is(map.data[0].lineNumber, Int);
    Assert.equals(23, map.found);
    Assert.equals(11, map.hit);
  }

  /** Tests the `toString()` method. **/
  public function testToString() {
    // It should return a format like "FNF:<found>\nFNH:<hit>".
    Assert.equals('FNF:0\nFNH:0', Std.string(new FunctionCoverage()));

    final coverage = new FunctionCoverage(23, 11, [new FunctionData('main', 127, 3)]);
    Assert.equals('FN:127,main\nFNDA:3,main\nFNF:23\nFNH:11', Std.string(coverage));
  }
}
