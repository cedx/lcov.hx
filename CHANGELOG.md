# Changelog

## Version [5.0.0](https://github.com/cedx/lcov.hx/compare/v4.0.0...v5.0.0)
- Breaking change: renamed the `Report.fromString()` method to `parse()`.

## Version [4.0.0](https://github.com/cedx/lcov.hx/compare/v3.0.1...v4.0.0)
- Breaking change: renamed the `Record` class to `SourceFile`.
- Breaking change: renamed the `Report.records` property to `sourceFiles`.

## Version [3.0.1](https://github.com/cedx/lcov.hx/compare/v3.0.0...v3.0.1)
- Restored the [HashLink](https://hashlink.haxe.org) tests.
- Updated the project URL.

## Version [3.0.0](https://github.com/cedx/lcov.hx/compare/v2.0.1...v3.0.0)
- Breaking change: the `Report.fromCoverage()` method now returns an `Outcome<Report, Error>`.
- Breaking change: renamed the `Report.fromCoverage()` method to `fromString()`.
- Breaking change: removed the `LcovException` class.
- Updated the package dependencies.

## Version [2.0.1](https://github.com/cedx/lcov.hx/compare/v2.0.0...v2.0.1)
- Updated the documentation.
- Updated the project URL.

## Version [2.0.0](https://github.com/cedx/lcov.hx/compare/v1.1.0...v2.0.0)
- Breaking change: the model classes are now implemented as [Coconut Data](https://github.com/MVCoconut/coconut.data) models.

## Version [1.1.0](https://github.com/cedx/lcov.hx/compare/v1.0.4...v1.1.0)
- Added support for [HashLink](https://hashlink.haxe.org) and [JVM](https://www.java.com) testing.
- Dropped the [Composer](https://getcomposer.org) and [npm](https://www.npmjs.com) packages.
- Replaced the build system based on [PowerShell](https://docs.microsoft.com/en-us/powershell) by [lix](https://github.com/lix-pm/lix.client) scripts.
- Replaced the [`utest`](https://lib.haxe.org/p/utest) package by [`tink_unittest`](https://lib.haxe.org/p/tink_unittest) for testing.
- Updated the package dependencies.

## Version [1.0.4](https://github.com/cedx/lcov.hx/compare/v1.0.3...v1.0.4)
- Added the `@:structInit` compiler metadata to data classes.
- Fixed the [TypeScript](https://www.typescriptlang.org) typings.
- Replaced the [`tink_unittest`](https://lib.haxe.org/p/tink_unittest) package by [`utest`](https://lib.haxe.org/p/utest) for testing.

## Version [1.0.3](https://github.com/cedx/lcov.hx/compare/v1.0.2...v1.0.3)
- Updated the [PHP](https://www.php.net) dependencies.

## Version [1.0.2](https://github.com/cedx/lcov.hx/compare/v1.0.1...v1.0.2)
- Fixed the [npm](https://www.npmjs.com) packaging.

## Version [1.0.1](https://github.com/cedx/lcov.hx/compare/v1.0.0...v1.0.1)
- Added the [TypeScript](https://www.typescriptlang.org) typings.

## Version 1.0.0
- Initial release.
