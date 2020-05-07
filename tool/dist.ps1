#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

tool/clean.ps1
tool/version.ps1
haxe build.hxml

if (!(Test-Path build)) { New-Item build -ItemType Directory | Out-Null }
Copy-Item lib/js/lcov.cjs build/lcov.js
node_modules/.bin/terser.ps1 --config-file=etc/terser.json --output=build/lcov.min.js build/lcov.js

foreach ($item in Get-ChildItem lib/php) {
  if ($item.BaseName -ne 'lcov') { Remove-Item $item -Recurse }
}
