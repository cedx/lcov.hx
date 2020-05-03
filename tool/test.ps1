#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)
& node_modules/.bin/mocha.ps1 --recursive
& vendor/bin/phpunit --configuration=etc/phpunit.xml
