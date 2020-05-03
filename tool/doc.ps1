#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)
haxelib run dox
mkdocs build --config-file=etc/mkdocs.yaml
