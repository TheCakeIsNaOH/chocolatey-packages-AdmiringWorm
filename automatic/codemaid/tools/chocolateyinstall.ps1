﻿$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$parameters = @{
  PackageName = $env:ChocolateyPackageName
  File        = "$toolsPath\CodeMaid.v11.0.183.vsix"
}

Install-VisualStudioVsixExtension @parameters

Remove-Item -Force -ea 0 "$toolsPath\*.vsix"
