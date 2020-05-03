#!/usr/bin/env pwsh
$root = Split-Path $PSScriptRoot
$package = Get-Content "$root/haxelib.json" | ConvertFrom-Json
(Get-Content "$root/package.json" -Encoding UTF8) -replace '"version": "\d+(\.\d+){2}"', """version"": ""$($package.version)""" | Out-File "$root/package.json" -Encoding UTF8
