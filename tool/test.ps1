#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

Write-Host "> Testing Eval target..."
haxe --interp test.hxml

Write-Host "> Testing JavaScript target..."
haxe --define js-es=6 --js var/tests.js test.hxml
node var/tests.js

Write-Host "> Testing NekoVM target..."
haxe --neko var/tests.n test.hxml
neko var/tests.n

Write-Host "> Testing PHP target..."
haxe --define php-lib=php --php lib test.hxml
php lib/index.php
