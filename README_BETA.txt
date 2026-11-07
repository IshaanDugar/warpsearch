# WarpSearch Beta (test build)

WarpSearch finds the file and the exact page or slide for what you describe, using only your own notes and
slides, on your own computer. If it is not sure, it says so instead of guessing.

This is a test build. It stops working on 21 November 2026, 12:00 Singapore time (21 November 2026, 04:00 UTC), unless the developer moves the date or ends the test early through an update.
Your files are only ever read, never changed.

## Install

Windows
  1. Run WarpSearch-Beta-Setup.exe. Windows SmartScreen may warn you: click "More info", then "Run anyway".
  2. It installs for your user only (no admin) and starts. Search with Ctrl+Alt+Space any time.

macOS
  1. Open the .dmg and drag WarpSearch Beta onto Applications. Use arm64 for Apple Silicon (M1 and later),
     x86_64 for Intel Macs.
  2. The first time, right-click WarpSearch Beta in Applications and choose Open. If macOS still blocks it:
     System Settings > Privacy & Security > "Open Anyway".
  3. There is no global hotkey on Mac in this build. The search window opens when you launch the app or click its
     Dock icon, and from the menu you get by right-clicking the window.

## First run

A window asks which folders to search. Click "Add folder..." (Documents and Desktop are common choices), read the terms (View terms) and tick "I agree to the beta terms", read the notice about the data this build sends, and press Start. A progress bar shows the files being read.
When it says Ready, the search box opens.

## Using it

- Type what you are looking for ("pipeline hazards", "slide about mitochondria"). Results show the file and page or slide.
- Up/Down moves, Enter opens the file at that page, Ctrl+P pins a result, Ctrl+C copies a citation, Esc hides the box.
- Rate the result list with the thumbs up/down at the bottom, or Ctrl+Up / Ctrl+Down.
- "Feedback" at the bottom (also in the menu) sends a 1-5 star rating and a note.
- Right-click the search box for the menu: Choose folders, Re-index now, Start at login on/off, Send feedback, Copy my tester ID, Quit.
- "Start WarpSearch Beta when I log in" (ticked in setup) keeps it ready in the tray after you sign in. Turn it off from the menu any time.
  On Windows the same menu is on the tray icon.

## Staying up to date

- Your notes: WarpSearch notices new and changed files in your folders by itself and updates the index within
  about a minute, at low priority. You can turn this off (tray menu: "Keep my notes up to date automatically"),
  and it pauses on battery unless you allow it. "Re-index now" is still in the menu.
- The app: WarpSearch Beta updates itself. It checks for a new version when it starts and every few hours, and
  installs it quietly when it is not busy. There is no need to download new builds. The check sends nothing
  but the app version.
- Activity (tray menu): how many questions your assistants asked WarpSearch, how many tokens it sent them, and an
  estimate of the tokens it saved them compared with reading the whole files. These numbers stay on your computer.

## Data sharing (always on in this test build)

This test build sends usage data to the developer. There is no switch: to stop it, uninstall WarpSearch Beta.
Everyone who tests agreed to this beforehand.

WarpSearch Beta sends the developer:
  - what you search for (the words you type, once you stop typing; very long searches are cut at 2000
    characters), how long the search took, how many results it gave, whether it said "Not in your notes", and the
    top 5 results: file name, page or slide, and score
  - what you did with a result: open, pin or copy, its position in the list, its file type, how long after you
    typed; your thumbs up/down and any feedback you write
  - file names (but never full paths: a file inside a folder you chose is sent as "folder name/sub/file.pdf",
    anything else as "<path>") and text from your notes: the pages an AI assistant receives (see below)
  - timings and counts: time to start, to search and to index, pages per second, peak memory; per file type
    how many files, pages, scanned pages and failures, and the total size of your files in MB
  - your computer: OS and build number, CPU model, RAM, free disk space on the drive that holds the index, screen
    size and display scale, language, app version, and whether it started normally or at login
  - setup: how many folders you chose and how long each setup step took
  - errors: the error type, a message with file paths removed, and the code location (module, function, line)
  - which menu items you use, how many times the window was shown or hidden, how long a session lasted and how
    many searches it had; one final note when the test ends

When you use WarpSearch from an AI assistant (Claude, Codex or another MCP client), it also sends:
  - the assistant's name and version, every request the assistant makes (the search words, evidence ids), and
    the full reply WarpSearch gave it, which contains text from your notes with file name and page or slide
  - timings, whether the engine was cold, errors with the code location, and the ranked candidate files
  - feedback the assistant sends for you with the "report" tool: your verdict and note, the full text of the
    pages involved, and the page you say is correct
  - when you connect an assistant with the "Connect to Claude/Codex" window: which assistant and whether it worked
The folders you chose in WarpSearch Beta are the folders an assistant can read. Nothing else is shared.

Who it is tied to: a random ID made on your computer when you first run the app. The app never asks for your name
or email. It is not anonymous: the ID is the same on every send, the server sees your internet address as any
website does, and your searches, notes text and feedback are sent as written.

How long: the data is kept only for this beta and is deleted by 30 November 2026.

Deleting your data: choose "Copy my tester ID" from the menu and send that ID to the developer at
Ishaan (the developer), saying you want your data deleted. It is then deleted.

## What it reads

  - PDF (scanned pages are read on Windows)
  - .docx (and the text in pictures inside it, on Windows)
  - .pptx (and the text in pictures on slides, on Windows)
  - .xlsx / .xlsm / .xls: one page per sheet (long sheets are split every 100 rows); the result shows the sheet name
  - images .png .jpg .jpeg .bmp .tif .tiff .webp: the text in the picture is read (Windows only); tiny icons are skipped
  - .txt / .md
  - NOT read: .doc and .ppt (old Word and PowerPoint). Save them as .docx / .pptx. On Mac, images and scanned pages
    are not read.

## Known limits

- Windows reads scanned pages and pictures itself (OCR is built in). On Mac, scanned pages and pictures of text are skipped in this beta.
- English only.

## Uninstall

Windows: Settings > Apps > WarpSearch Beta > Uninstall. It asks if you also want to delete your index and settings.
macOS: drag WarpSearch Beta from Applications to the Bin.
Your index and settings live in a separate folder. To delete them yourself:
  Windows: %LOCALAPPDATA%\DiskAI-Beta
  macOS:   ~/Library/Application Support/DiskAI-Beta
When the test ends, your index is kept until you delete that folder.

## Contact

Reply to the person who sent you this, or write to Ishaan (the developer).

## Terms

The beta terms are in TERMS_BETA.txt (next to this file) and under "View terms" in the first-run window.
