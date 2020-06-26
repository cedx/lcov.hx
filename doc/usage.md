---
path: src/branch/main
source: src/lcov/Report.hx
---

# Usage
**LCOV Reports** provides a set of classes representing a [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) coverage report and its data.
The `Report` class, the main one, provides the parsing and formatting features.

## Parse coverage data from a LCOV file
The `Report.fromCoverage()` static method parses a [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) coverage report provided as string, and creates a `Report` instance giving detailed information about this coverage report:

=== "Haxe"
		:::haxe
		import haxe.Json;
		import lcov.LcovException;
		import lcov.Report;
		import sys.io.File;

		class Main {
			static function main() {
				try {
					final coverage = File.getContent("/path/to/lcov.info");
					final report = Report.fromCoverage(coverage);

					final count = report.records.length;
					Sys.println('The coverage report contains $count records:');
					Sys.println(Json.stringify(report, null, "\t"));
				}

				catch (e: LcovException) {
					Sys.println('An error occurred: "${e.message}" at offset ${e.offset}.');
				}
			}
		}

=== "JavaScript"
		:::js
		import {Report} from "@cedx/lcov.hx";
		import {readFile} from "fs/promises";

		async function main() {
			try {
				const coverage = await readFile("/path/to/lcov.info", "utf8");
				const report = Report.fromCoverage(coverage);

				const count = report.records.length;
				console.log(`The coverage report contains ${count} records:`);
				console.log(JSON.stringify(report, null, "\t"));
			}

			catch (error) {
				console.log(`An error occurred: ${error.message} at offset ${error.offset}.`);
			}
		}

=== "PHP"
		:::php
		<?php
		use lcov\{LcovException, Report};

		function main(): void {
			try {
				$coverage = file_get_contents("/path/to/lcov.info");
				$report = Report::fromCoverage($coverage);
				
				$count = count($report->records);
				print "The coverage report contains $count records:" . PHP_EOL;
				print json_encode($report, JSON_PRETTY_PRINT);
			}

			catch (LcovException $e) {
				print "An error occurred: '{$e->getMessage()}' at offset {$e->offset}.";
			}
		}

!!! info
	A `LcovException` is thrown if any error occurred while parsing the coverage report.

Converting the `Report` instance to [JSON](https://www.json.org) format will return a map like this:

``` json
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

!!! tip
	See the [API reference](https://api.belin.io/lcov.hx) of this library for more information on the `Report` class.

## Format coverage data to the LCOV format
Each class provided by this library has a dedicated `toString()` method returning the corresponding data formatted as [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) string.
All you have to do is to create the adequate structure using these different classes, and to export the final result:

=== "Haxe"
		:::haxe
		import lcov.*;

		class Main {
			static function main() {
				final lineCoverage = new LineCoverage(2, 2, [
					new LineData(6, 2, "PF4Rz2r7RTliO9u6bZ7h6g"),
					new LineData(7, 2, "yGMB6FhEEAd8OyASe3Ni1w")
				]);

				final record = new Record("/home/cedx/lcov.hx/fixture.hx", {
					functions: new FunctionCoverage(1, 1),
					lines: lineCoverage
				});

				final report = new Report("Example", [record]);
				Sys.println(report.toString());
			}
		}

=== "JavaScript"
		:::js
		import {
			FunctionCoverage, LineCoverage, LineData,
			Record, Report
		} from "@cedx/lcov.hx";

		function main() {
			const lineCoverage = new LineCoverage(2, 2, [
				new LineData(6, 2, "PF4Rz2r7RTliO9u6bZ7h6g"),
				new LineData(7, 2, "yGMB6FhEEAd8OyASe3Ni1w")
			]);

			const record = new Record("/home/cedx/lcov.hx/fixture.js", {
				functions: new FunctionCoverage(1, 1),
				lines: lineCoverage
			});

			const report = new Report("Example", [record]);
			console.log(report.toString());
		}

=== "PHP"
		:::php
		<?php
		use lcov\{FunctionCoverage, LineCoverage, LineData, Record, Report};

		function main(): void {
			$lineCoverage = new LineCoverage(2, 2, [
				new LineData(6, 2, "PF4Rz2r7RTliO9u6bZ7h6g"),
				new LineData(7, 2, "yGMB6FhEEAd8OyASe3Ni1w")
			]);

			$record = new Record("/home/cedx/lcov.hx/fixture.php", [
				'functions' => new FunctionCoverage(1, 1),
				'lines' => $lineCoverage
			]);

			$report = new Report("Example", [$record]);
			print $report;
		}

The `Report.toString()` method will return a [LCOV](http://ltp.sourceforge.net/coverage/lcov.php) report formatted like this:

```
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

!!! tip
	See the [API reference](https://api.belin.io/lcov.hx) of this library for detailed information on the available classes.
