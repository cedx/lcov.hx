#!/usr/bin/env pwsh
$root = Split-Path $PSScriptRoot
& "$root/node_modules/.bin/mocha"
& "$root/vendor/bin/phpunit" --configuration="$root/etc/phpunit.xml"
