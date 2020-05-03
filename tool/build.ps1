#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)
& tool/clean.ps1
haxe build.hxml
if (!(Test-Path build)) { New-Item build -ItemType Directory | Out-Null }
& node_modules/.bin/terser.ps1 --config-file=etc/terser.json --output=build/lcov.js lib/js/lcov.cjs
