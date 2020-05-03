#!/usr/bin/env pwsh
$root = Split-Path $PSScriptRoot
& "$root/tool/clean.ps1"
haxe "$root/build.hxml"
