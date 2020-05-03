#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)
if (Test-Path lib/js/lcov.cjs) { Remove-Item lib/js/lcov.cjs }
if (Test-Path lib/php) { Remove-Item lib/php -Recurse }
if (Test-Path www) { Remove-Item www -Recurse }
Get-ChildItem var -Exclude .gitkeep | ForEach-Object { Remove-Item $_.FullName -Recurse }
