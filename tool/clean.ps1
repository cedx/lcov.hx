#!/usr/bin/env pwsh
$root = Split-Path $PSScriptRoot
if (Test-Path "$root/lib/js/browser.cjs") { Remove-Item "$root/lib/js/browser.cjs" }
if (Test-Path "$root/lib/php") { Remove-Item "$root/lib/php" -Recurse }
if (Test-Path "$root/www") { Remove-Item "$root/www" -Recurse }
Get-ChildItem "$root/var" -Exclude .gitkeep | ForEach-Object { Remove-Item $_.FullName -Recurse }
