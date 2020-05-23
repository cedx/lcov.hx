#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

$version = (Get-Content haxelib.json | ConvertFrom-Json).version
haxe build.hxml
haxelib run dox `
	--define description "Parse and format to LCOV your code coverage reports, in Haxe, JavaScript and PHP. The best way to share your code coverage stats." `
	--define logo "https://api.belin.io/lcov.hx/favicon.ico" `
	--define source-path "https://git.belin.io/cedx/lcov.hx/src/branch/master/src" `
	--define themeColor 0xffc105 `
	--define version $version `
	--define website "https://belin.io" `
	--input-path var `
	--output-path doc/api `
	--title "LCOV Reports" `
	--toplevel-package lcov

Copy-Item doc/img/favicon.ico doc/api
mkdocs build --config-file=etc/mkdocs.yaml
