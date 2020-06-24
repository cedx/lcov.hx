#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

foreach ($item in ".temp", "build", "doc/api", "lib/index.php", "lib/js/lcov.*", "lib/php", "lib/res", "www") {
	if (Test-Path $item) { Remove-Item $item -Force -Recurse }
}

Get-ChildItem var -Exclude .gitkeep | Remove-Item -Force -Recurse
