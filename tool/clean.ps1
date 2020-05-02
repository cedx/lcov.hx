#!/usr/bin/env pwsh
$root = Split-Path $PSScriptRoot
Remove-Item "$root/lib/js/browser.cjs"
if (Test-Path "$root/lib/php") { Remove-Item -Force -Recurse "$root/lib/php" }
