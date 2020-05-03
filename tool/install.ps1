#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)

haxelib newrepo
haxelib install checkstyle
haxelib install dox
haxelib install formatter
haxelib install all

composer install
npm install --ignore-scripts --production=false
