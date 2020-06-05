# Installation

## Requirements
Before installing **WebStorage.hx**, you need to make sure you have either
[Haxe](https://haxe.org), [Node.js](https://nodejs.org) or [PHP](https://www.php.net) up and running.
		
You can verify if you're already good to go with the following commands:

=== "Haxe"
		:::shell
		haxe --version
		# 4.1.1

		haxelib version
		# 4.0.2

=== "JavaScript"
		:::shell
		node --version
		# v14.4.0

		npm --version
		# 6.14.5

=== "PHP"
		:::shell
		php --version
		# PHP 7.4.6 (cli) (built: May 12 2020 11:38:52) ( NTS Visual C++ 2017 x64 )

		composer --version
		# Composer version 1.10.7 2020-06-03 10:03:56

!!! info
	If you plan to play with the package sources, you will also need
	[PowerShell](https://docs.microsoft.com/en-us/powershell) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material).

## Installing with a package manager

=== "Haxe"
	From a command prompt, run:

		:::shell
		haxelib install lcov

	Now in your [Haxe](https://haxe.org) code, you can use:

		:::haxe
		import lcov.*;

=== "JavaScript"
	From a command prompt, run:

		:::shell
		npm install @cedx/lcov.hx

	Now in your [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) code, you can use:

		:::js
		// CommonJS module.
		const lcov = require("@cedx/lcov.hx");

		// ECMAScript module.
		import * as lcov from "@cedx/lcov.hx";

=== "PHP"
	From a command prompt, run:

		:::shell
		composer require cedx/lcov.hx

	Now in your [PHP](https://www.php.net) code, you can use:

		:::php
		<?php
		use lcov\{
			BranchCoverage, BranchData,
			FunctionCoverage, FunctionData,
			LineCoverage, LineData,
			LcovException, Record, Report
		};

## Installing from a content delivery network
This library is also available as a ready-made JavaScript bundle.
To install it, add one of these code snippets to the `<head>` of your HTML document:

``` html
<!-- jsDelivr -->
<script src="https://cdn.jsdelivr.net/npm/@cedx/lcov.hx/build/lcov.min.js"></script>

<!-- UNPKG -->
<script src="https://unpkg.com/@cedx/lcov.hx/build/lcov.min.js"></script>
```

The classes of this library are exposed as `lcov` property on the `window` global object:

``` html
<script>
	const {
		BranchCoverage, BranchData,
		FunctionCoverage, FunctionData,
		LineCoverage, LineData,
		LcovException, Record, Report
	} = window.lcov;
</script>
```
