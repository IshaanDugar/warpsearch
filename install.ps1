# Zarp Beta installer for Windows.
# Usage (PowerShell):  irm https://ishaandugar.github.io/zarp/install.ps1 | iex
#
# What it does: reads the latest release manifest, downloads the installer from
# GitHub, checks its SHA-256 against the manifest, then runs it. Nothing else.

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$manifestUrl = 'https://github.com/IshaanDugar/zarp/releases/latest/download/manifest.json'

Write-Host ''
Write-Host '  zarp.  getting the latest beta...' -ForegroundColor Yellow

try {
    $manifest = Invoke-RestMethod -Uri $manifestUrl -UseBasicParsing
} catch {
    Write-Host "  Couldn't reach GitHub. Check your connection and try again." -ForegroundColor Red
    return
}

$win = $manifest.payload.windows
if ($manifest.payload.beta_ended -or -not $win) {
    Write-Host '  The beta has ended. Thanks for testing!' -ForegroundColor Yellow
    return
}

$version = $manifest.payload.latest
$sizeMb = [math]::Round($win.size / 1MB)
$target = Join-Path $env:TEMP ("Zarp-Beta-Setup-{0}.exe" -f $version)

Write-Host ("  downloading version {0} ({1} MB)..." -f $version, $sizeMb)
Invoke-WebRequest -Uri $win.url -OutFile $target -UseBasicParsing

$hash = (Get-FileHash -Path $target -Algorithm SHA256).Hash.ToLowerInvariant()
if ($hash -ne $win.sha256.ToLowerInvariant()) {
    Remove-Item $target -Force -ErrorAction SilentlyContinue
    Write-Host "  The download doesn't match the published checksum, so I deleted it." -ForegroundColor Red
    Write-Host '  Try again in a minute. If it keeps happening, tell Ishaan.' -ForegroundColor Red
    return
}

Write-Host '  checksum matches. starting the installer...'
Start-Process -FilePath $target -Wait
Remove-Item $target -Force -ErrorAction SilentlyContinue
Write-Host '  done. pick your folders in the window that opened, and you are set.' -ForegroundColor Yellow
Write-Host ''
