#!/usr/bin/env pwsh
$root = Split-Path $PSScriptRoot
$package = Get-Content "$root/haxelib.json" | ConvertFrom-Json

function Update-File {
  param (
    [Parameter(Mandatory = $true, Position = 0)] [String] $file,
    [Parameter(Mandatory = $true, Position = 1)] [String] $pattern,
    [Parameter(Mandatory = $true, Position = 2)] [String] $replacement
  )

  (Get-Content $file -Encoding UTF8) -replace $pattern, $replacement | Out-File $file -Encoding UTF8
}

Update-File "$root/package.json" '"version": "\d+(\.\d+){2}"' """version"": ""$($package.version)"""
Update-File "$root/doc/index.md" 'release-v\d+(\.\d+){2}"' "release-v$($package.version)"
Update-File "$root/README.md" 'release-v\d+(\.\d+){2}"' "release-v$($package.version)"
