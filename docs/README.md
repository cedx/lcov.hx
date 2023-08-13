# LCOV Reports for Haxe
Parse and format [LCOV](https://github.com/linux-test-project/lcov) coverage reports, in [Haxe](https://haxe.org).

## Quick start
Install the latest version of **LCOV Reports for Haxe** with [lix](https://github.com/lix-pm/lix.client) package manager:

```shell
lix +lib lcov
```

For detailed instructions, see the [installation guide](installation.md).

## Usage
This library provides a set of classes representing a [LCOV](https://github.com/linux-test-project/lcov) coverage report and its data.
The `Report` class, the main one, provides the parsing and formatting features.

- [Parse coverage data from a LCOV file](usage/parsing.md)
- [Format coverage data to the LCOV format](usage/formatting.md)

## See also
- [API reference](api/)
- [Haxelib package](https://lib.haxe.org/p/lcov)
- [Code coverage](https://app.codecov.io/gh/cedx/lcov.hx)
