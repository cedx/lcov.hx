#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)
haxelib run dox --input-path var --output-path doc/api --title 'LCOV Reports' --toplevel-package lcov
mkdocs build --config-file=etc/mkdocs.yaml
