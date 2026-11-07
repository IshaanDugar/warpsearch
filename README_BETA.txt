WarpSearch Beta

Your AI, straight to the right page. At a quarter of the tokens.

Stop uploading the same PDFs over and over. WarpSearch learns your notes, slides and docs once, on your laptop,
then hands Claude or Codex the exact page that answers your question. In our tests Claude got every answer right
using about 4x fewer tokens, and finished faster. If something isn't in your notes, it says so instead of guessing.

Test build: it works until 21 November 2026, 12:00 Singapore time (04:00 UTC). An update can move that date or end
the test early. Your files are only read, never changed.


INSTALL (WINDOWS), ABOUT TWO MINUTES

1. Run WarpSearch-Beta-Setup.exe. If Windows says it protected your PC, click "More info", then "Run anyway".
2. Pick the folders with your notes, tick the terms box, press Start.
3. Quit Claude Desktop from the tray and open it again. On Claude Code or Codex, start a new session.
4. Ask: "Using WarpSearch, what did my notes say about <topic>? Cite the page."

Nothing connected? Right-click the tray icon > "Connect to Claude / Codex...".


GOOD TO KNOW

- It updates itself, and new or changed files in your folders show up within about a minute.
- Tray menu: Activity (questions answered, roughly how many tokens it saved you), Choose folders, Re-index now, Quit.
  Auto-updating your notes can be switched off there, and it pauses on battery unless you allow it.
- No AI handy? Ctrl+Alt+Space opens a search box.
- It reads PDF (scans too), .docx, .pptx, .xlsx/.xls, pictures with text, .txt and .md. Old .doc and .ppt files
  need saving as .docx/.pptx first. English only.
- Got a wrong answer? Tell your assistant: "Report to WarpSearch: wrong, the answer is ... on page ...".
  That helps me more than anything else.


WHAT THIS BETA SENDS ME

There's no off switch in this test build; uninstalling stops it. Everyone testing agreed to this first.

From the search box: what you type (cut at 2000 characters), how long the search took, the top 5 results (file name,
page, score), whether it said "not in your notes", what you did with a result (open, pin, copy), thumbs and feedback.

From your AI assistant: its name and version, every request it makes, and the full reply WarpSearch gave it, which
includes text from your notes with file name and page. Timings, errors and the ranked candidate files too. If you
use "Report to WarpSearch": your verdict, your note and the full text of the pages involved.

About your setup: file names as "folder/sub/file.pdf" (never full paths), counts and sizes per file type, index
and search timings, your OS, CPU, RAM, free disk, screen size, language, app version, setup steps, menu use, update
events and connection results.

It's tied to a random ID made on your computer, not your name or email. It isn't anonymous though: the ID is the same
every time, the server sees your IP address like any website, and your questions and note text arrive as written.
The data is deleted by 30 November 2026. To delete yours sooner, choose "Copy my tester ID" from the menu and send it
to Ishaan.

The update check sends nothing except the app version.


UNINSTALL

Settings > Apps > WarpSearch Beta > Uninstall. It asks whether to delete your index and settings too.
They live in %LOCALAPPDATA%\DiskAI-Beta if you want to remove them yourself.


Terms: TERMS_BETA.txt (next to this file, and under "View terms" in the setup window).
Questions: Ishaan.
