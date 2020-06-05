#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

tool/clean.ps1
tool/version.ps1
tool/build.ps1

if (-not (Test-Path build)) { New-Item build -ItemType Directory | Out-Null }
Copy-Item lib/js/lcov.js build/lcov.js
node_modules/.bin/terser --config-file=etc/terser.json --output=build/lcov.min.js build/lcov.js

Get-ChildItem lib/php -Exclude lcov | Remove-Item -Recurse
