# Usage
**LCOV Reports for Haxe** provides a set of classes representing a [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) coverage report and its data.
The `Report` class, the main one, provides the parsing and formatting features.

## Parse coverage data from a LCOV file
The `Report.fromCoverage()` static method parses a [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) coverage report provided as string, and creates a `Report` instance giving detailed information about this coverage report:

```haxe
import lcov.LcovException;
import lcov.Report;
import sys.io.File;
import tink.Json;

function main() try {
	final report = Report.fromCoverage(File.getContent("/path/to/lcov.info"));
	Sys.println('The coverage report contains ${report.records.length} records:');
	Sys.println(Json.stringify(report, null, "\t"));
} catch (e: LcovException) Sys.println('An error occurred: "${e.message}" at offset ${e.offset}.');
```

?> A `LcovException` is thrown if any error occurred while parsing the coverage report.

Converting the `Report` instance to [JSON](https://www.json.org) format will return a map like this:

```json
{
	"testName": "Example",
	"records": [
		{
			"sourceFile": "/home/cedx/lcov.hx/fixture.hx",
			"branches": {
				"found": 0,
				"hit": 0,
				"data": []
			},
			"functions": {
				"found": 1,
				"hit": 1,
				"data": [
					{"functionName": "main", "lineNumber": 4, "executionCount": 2}
				]
			},
			"lines": {
				"found": 2,
				"hit": 2,
				"data": [
					{"lineNumber": 6, "executionCount": 2, "checksum": "PF4Rz2r7RTliO9u6bZ7h6g"},
					{"lineNumber": 9, "executionCount": 2, "checksum": "y7GE3Y4FyXCeXcrtqgSVzw"}
				]
			}
		}
	]
}
```

?> See the [API reference](https://cedx.github.io/lcov.hx/api) of this library for more information on the `Report` class.

## Format coverage data to the LCOV format
Each class provided by this library has a dedicated `toString()` method returning the corresponding data formatted as [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) string.
All you have to do is to create the adequate structure using these different classes, and to export the final result:

```haxe
import lcov.*;

function main() {
	final lineCoverage = new LineCoverage({found: 2, hit: 2, data: [
		new LineData({lineNumber: 6, executionCount: 2, checksum: "PF4Rz2r7RTliO9u6bZ7h6g"}),
		new LineData({lineNumber: 7, executionCount: 2, checksum: "yGMB6FhEEAd8OyASe3Ni1w"})
	]});

	final record = new Record({
		sourceFile: "/home/cedx/lcov.hx/fixture.hx",
		functions: new FunctionCoverage({found: 1, hit: 1}),
		lines: lineCoverage
	});

	final report = new Report({testName: "Example", records: [record]});
	Sys.println(report.toString());
}
```

The `Report.toString()` method will return a [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) report formatted like this:

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

?> See the [API reference](https://cedx.github.io/lcov.hx/api) of this library for detailed information on the available classes.
