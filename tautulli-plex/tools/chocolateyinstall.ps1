$ErrorActionPreference	= 'Stop'; # stop on all errors
$toolsDir				= "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64					= "https://github.com/Tautulli/Tautulli/releases/download/v2.12.3/Tautulli-windows-v"+$ENV:ChocolateyPackageVersion+"-x64.exe"
 
$packageArgs	= @{
  packageName		= $env:ChocolateyPackageName
  filetype			= 'EXE'
  url64bit			= $url64
  silentArgs		= '/S'
  checksum			= 'F2F9C49F0C1ED8F5FA478C71DADD5C62F491835A92125D64EF5ED644903A50FB'
  checksumType		=	'sha256'
  validExitCodes	= @(0, 3010, 1641)
}
 
Install-ChocolateyPackage @packageArgs