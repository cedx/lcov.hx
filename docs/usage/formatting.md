# LCOV formatting
Each class provided by this library has a dedicated `toString()` method returning the corresponding data formatted as [LCOV](https://github.com/linux-test-project/lcov) string.
All you have to do is to create the adequate structure using these different classes, and to export the final result:

```haxe
import lcov.FunctionCoverage;
import lcov.LineCoverage;
import lcov.LineData;
import lcov.Report;
import lcov.SourceFile;

function main() {
  final sourceFile = new SourceFile({
    path: "/home/cedx/lcov.hx/fixture.hx",
    functions: new FunctionCoverage({found: 1, hit: 1}),
    lines: new LineCoverage({found: 2, hit: 2, data: [
      new LineData({lineNumber: 6, executionCount: 2, checksum: "PF4Rz2r7RTliO9u6bZ7h6g"}),
      new LineData({lineNumber: 7, executionCount: 2, checksum: "yGMB6FhEEAd8OyASe3Ni1w"})
    ]})
  });

  final report = new Report({testName: "Example", sourceFiles: [sourceFile]});
  Sys.println(report);
}
```

The `Report.toString()` method will return a [LCOV](https://github.com/linux-test-project/lcov) report formatted like this:

```lcov
TN:Example
SF:/home/cedx/lcov.hx/fixture.hx
FNF:1
FNH:1
DA:6,2,PF4Rz2r7RTliO9u6bZ7h6g
DA:7,2,yGMB6FhEEAd8OyASe3Ni1w
LF:2
LH:2
end_of_record
```

> See the [API reference](api/) of this library for detailed information on the available classes.
