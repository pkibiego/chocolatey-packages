# Stop Tautulli if it's running
$tautulliProcess = Get-Process Tautulli -ErrorAction SilentlyContinue
if ($tautulliProcess) {
    Write-Host "Closing Tautulli before uninstallation..."
    $tautulliProcess.CloseMainWindow() | Out-Null
    Start-Sleep -Seconds 5 # Wait for the process to close
    if (!$tautulliProcess.HasExited) {
        $tautulliProcess | Stop-Process -Force
    }
    Write-Host "Tautulli has been closed successfully."
}

# Uninstall Tautulli
$uninstallPath = 'C:\Program Files\Tautulli\uninstall.exe'
if (Test-Path $uninstallPath) {
    Write-Host "Uninstalling Tautulli..."
    & $uninstallPath /S
} else {
    Write-Warning "Uninstall file not found at $uninstallPath"
}

Remove-Item -Path "$env:ProgramData\chocolatey\lib\$packageName" -Recurse -Force
Write-Host "Tautulli has been uninstalled and the $packageName directory has been deleted."