# How to commit so your work is tracked

AI-usage tracking runs from a **local git hook**. The hook only fires when you
commit **on your own machine**. Commits made in the GitHub website never run it,
so they show up as untracked in the weekly report.

Two things must be true for a commit to count:

1. You ran `setup-dev-environment.ps1` once in this clone.
2. The commit is a real local `git commit` — not a browser edit, not `--no-verify`.

---

## ✅ DO — this gets you tracked

1. **Clone** the repo to your machine (once):
   ```
   git clone https://github.com/Belo-Medical-Group/<repo>.git
   ```
2. **Run setup** once in that clone (wires the hook + execution policy):
   ```powershell
   .\setup-dev-environment.ps1      # Windows
   ```
   **macOS / Linux:** install PowerShell first (`brew install powershell`),
   then run the shell helper:
   ```sh
   ./setup-dev-environment.sh       # or: git config core.hooksPath .githooks
   ```
   (No `pwsh` installed? Commits still work — they're just not tracked.)
3. **Edit** in your IDE / editor.
4. **Commit locally:**
   ```
   git add .
   git commit -m "your message"
   ```
   A one-line **note prompt** appears when AI activity is detected — that prompt
   is proof the hook ran. Type a note or press Enter to skip.
5. **Push and open a PR:**
   ```
   git push
   ```

## ❌ DON'T — these make your work vanish from the report

- ❌ Editing files with the **"Edit this file" pencil** on github.com.
- ❌ **"Commit suggestion"** buttons or merging/editing in the browser.
- ❌ `git commit --no-verify` (explicitly skips the hook).
- ❌ Committing from a clone where you never ran `setup-dev-environment.ps1`.

---

## How do I know it worked?

After committing, check the last commit message:

```
git log -1 --format="%B"
```

You should see trailer lines like:

```
AI-Usage: yes
AI-Interactions: 23
Lines-Added: 142
...
```

No trailers = the hook didn't run. Re-run `setup-dev-environment.ps1` and make
sure you're committing locally, then commit again.

---

## Why this exists

The weekly **Org AI Usage Report** (in the `ai-usage-tracking` repo) groups
developers by GitHub login and shows a **Process compliance** table:

| Bucket | What it means |
|---|---|
| **Tracked ✅** | proper local commit — you're done right |
| **Web-UI ✋** | committed in the browser — the hook couldn't run |
| **Local-untracked ⚠** | local commit but no trailer — setup missing or `--no-verify` |

Nobody is blocked. But a row of 0% tracked is visible to everyone — the fix is
simply to commit locally.
