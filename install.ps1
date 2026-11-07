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

Write-Host '  checksum matches. installing (about 30 seconds, no clicks needed)...'
# /SILENT shows a small progress bar and skips every wizard page. The installer
# then starts Zarp, which opens its setup window on the first run.
# Wait for the installer process only. Start-Process -Wait would also wait for
# Zarp itself (the installer starts it), so the window would hang until Zarp quits.
$p = Start-Process -FilePath $target -ArgumentList '/SILENT', '/SUPPRESSMSGBOXES', '/NORESTART', '/SP-' -PassThru
$p.WaitForExit()
Remove-Item $target -Force -ErrorAction SilentlyContinue
if ($p.ExitCode -ne 0) {
    Write-Host ("  The installer stopped with code {0}. Close Zarp from the tray if it's open, then run this line again." -f $p.ExitCode) -ForegroundColor Red
    return
}

Write-Host ''
Write-Host '  installed. the setup window opens in a few seconds:' -ForegroundColor Yellow
Write-Host '  pick the folders your notes live in, press Start, then restart Claude Desktop once.'
Write-Host '  (already set up? then it just updated, and it is running in your tray.)'
Write-Host ''
Write-Host '  one honest heads-up: this is a beta, so things might break.' -ForegroundColor Yellow
Write-Host '  if anything feels off, tell your AI "report to Zarp: ..." or open an issue at'
Write-Host '  https://github.com/IshaanDugar/zarp/issues  and I will fix it and push an update fast.'
Write-Host '  thanks for testing.  - Ishaan'
Write-Host ''
