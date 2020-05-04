#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)

tool/clean.ps1
tool/build.ps1

if (!(Test-Path build)) { New-Item build -ItemType Directory | Out-Null }
Copy-Item lib/js/lcov.cjs build/lcov.js
& node_modules/.bin/terser.ps1 --config-file=etc/terser.json --output=build/lcov.min.js build/lcov.js
