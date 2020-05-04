#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)
tool/build.ps1
node_modules/.bin/mocha.ps1 --recursive
vendor/bin/phpunit --configuration=etc/phpunit.xml
