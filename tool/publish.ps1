#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)
haxelib submit
npm publish --registry=https://registry.npmjs.org
