#!/usr/bin/env pwsh
$root = Split-Path $PSScriptRoot
haxelib run checkstyle --config "$root/etc/checkstyle.json" --progress --source "$root/src"
