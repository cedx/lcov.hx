#!/usr/bin/env pwsh
$root = Split-Path $PSScriptRoot
haxelib run dox
mkdocs build --config-file="$root/etc/mkdocs.yaml"
