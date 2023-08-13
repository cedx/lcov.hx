# LCOV parsing
The `Report.parse()` static method parses a [LCOV](https://github.com/linux-test-project/lcov) coverage report provided as string, and returns an `Outcome<Report, Error>`. The `Report` instance gives detailed information about the provided coverage report:

```haxe
import lcov.Report;
import sys.io.File;
import tink.Json;

function main() switch Report.parse(File.getContent("/path/to/lcov.info")) {
  case Failure(error):
    Sys.println(error.message);
  case Success(report):
    Sys.println('The coverage report contains ${report.sourceFiles.length} source files:');
    Sys.println(Json.stringify(report));
}
```

Converting the `Report` instance to [JSON](https://www.json.org) format will return a map like this:

```json
{
  "testName": "Example",
  "sourceFiles": [
    {
      "path": "/home/cedx/lcov.hx/fixture.hx",
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

> See the [API reference](api/) of this library for more information on the `Report` class.
