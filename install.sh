#!/bin/bash
# Zarp Beta installer for macOS (Apple Silicon).
# Usage (Terminal):  curl -fsSL https://ishaandugar.github.io/zarp/install.sh | bash
#
# What it does: downloads the Mac app from the latest GitHub release, checks it
# against the published SHA-256, puts "Zarp Beta" in Applications and opens it.
set -euo pipefail

BASE="https://github.com/IshaanDugar/zarp/releases/latest/download"
ZIP="Zarp-Beta-mac-arm64.zip"
APP="Zarp Beta.app"

say() { printf '  %s\n' "$*"; }
fail() { printf '  \033[31m%s\033[0m\n' "$*" >&2; exit 1; }

printf '\n  \033[33mzarp.\033[0m  getting the latest beta...\n'

[ "$(uname -s)" = "Darwin" ] || fail "This installer is for macOS. On Windows, use the PowerShell line on the page."
[ "$(uname -m)" = "arm64" ] || fail "This beta is for Apple Silicon Macs (M1 and newer) for now. Intel Macs: soon, sorry."

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

say "downloading..."
curl -fsSL "$BASE/$ZIP" -o "$TMP/$ZIP" || fail "Couldn't reach GitHub. Check your connection and try again."
curl -fsSL "$BASE/$ZIP.sha256" -o "$TMP/$ZIP.sha256" || fail "Couldn't get the checksum file. Try again in a minute."

want="$(awk '{print $1}' "$TMP/$ZIP.sha256" | tr 'A-F' 'a-f')"
have="$(shasum -a 256 "$TMP/$ZIP" | awk '{print $1}')"
[ -n "$want" ] && [ "$want" = "$have" ] || fail "The download doesn't match the published checksum, so I stopped. Try again; if it keeps happening, tell Ishaan."
say "checksum matches. installing..."

ditto -x -k "$TMP/$ZIP" "$TMP/unzipped"
[ -d "$TMP/unzipped/$APP" ] || fail "The download didn't contain the app. Tell Ishaan."

DEST="/Applications"
[ -w "$DEST" ] || { DEST="$HOME/Applications"; mkdir -p "$DEST"; }

# Quit a running copy first so it can be replaced.
osascript -e 'tell application "Zarp Beta" to quit' >/dev/null 2>&1 || true
sleep 1
rm -rf "$DEST/$APP"
ditto "$TMP/unzipped/$APP" "$DEST/$APP"
xattr -dr com.apple.quarantine "$DEST/$APP" 2>/dev/null || true

open "$DEST/$APP"

printf '\n  \033[33minstalled in %s.\033[0m the setup window opens in a few seconds:\n' "$DEST"
say "pick the folders your notes live in, press Start, then quit Claude Desktop (Cmd+Q) and open it again."
say "(already set up? then it just updated, and it is in your menu bar.)"
printf '\n  \033[33mone honest heads-up: this is a beta, so things might break.\033[0m\n'
say "if anything feels off, tell your AI \"report to Zarp: ...\" or open an issue at"
say "https://github.com/IshaanDugar/zarp/issues  and I will fix it and push an update fast."
say "thanks for testing.  - Ishaan"
printf '\n'
