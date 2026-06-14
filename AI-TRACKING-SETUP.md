# AI Usage Tracking — Setup Guide

## What gets written to every commit

Every commit automatically gains trailers. No Claude activity:

    AI-Usage: no
    AI-Sessions: 0
    AI-Interactions: 0

With Claude activity:

    AI-Usage: yes
    AI-Sessions: 2
    AI-Interactions: 23
    AI-file-edit: 8
    AI-file-read: 4
    AI-terminal: 6
    AI-research: 3
    AI-planning: 2
    Tests-Executed: 5
    Lines-Added: 142
    Lines-Removed: 38
    Lines-Net: 104
    Docs-Files: 2
    Docs-InCode: yes
    Tests-Files: 3
    AI-Note: security review on auth module

Only AI categories with non-zero counts appear. `AI-Note` only appears
if the developer typed something at the optional prompt. The code metrics
(Lines-*, Docs-*, Tests-Files) are recorded on every commit regardless of
AI involvement. `Tests-Executed` appears only when Claude ran a test runner.

---

## The five auto-detected categories

| Trailer        | What it counts                                      | Confidence |
|----------------|-----------------------------------------------------|------------|
| `AI-file-edit` | Claude wrote or edited a file (Write/Edit tools)    | High       |
| `AI-file-read` | Claude read a file to understand context            | High       |
| `AI-terminal`  | Claude ran a terminal/bash command                  | High       |
| `AI-research`  | Claude did a web search or fetched a URL            | High       |
| `AI-planning`  | Claude used todo/task planning tools or sub-agents  | High       |

All five are detected automatically from Claude Code tool names.
No developer input required for these counts.

---

## Code & quality metrics (every commit)

These are recorded on every commit from git's own staged diff, regardless
of whether Claude was involved. They give you output volume to correlate
against AI activity.

| Trailer           | What it counts                                          | Confidence |
|-------------------|---------------------------------------------------------|------------|
| `Lines-Added`     | Lines added across all staged files                     | Exact      |
| `Lines-Removed`   | Lines removed across all staged files                   | Exact      |
| `Lines-Net`       | Added minus removed                                      | Exact      |
| `Docs-Files`      | Staged files matching doc patterns (.md, /docs/, etc.)  | High       |
| `Docs-InCode`     | yes/no — did the commit add any comments or docstrings  | Medium     |
| `Tests-Files`     | Staged files matching test patterns (.test., /tests/)   | High       |
| `Tests-Executed`  | Test-runner commands Claude ran (from JSONL logs)       | Partial    |

Two honest caveats:

- **Lines counts are commit-wide, not AI-attributed.** The hook cannot
  reliably know which specific lines Claude wrote versus the developer.
  The number tells you "this commit changed N lines and had M Claude
  interactions" — the correlation, without false precision.
- **`Tests-Executed` only captures tests Claude ran** via its terminal
  tool. Tests a developer runs manually in their own terminal are not
  visible to the hook. For definitive test-run verification, rely on CI.
- **`Docs-InCode` is a flag, not a count.** A commented-out line of code
  looks identical to a real comment, so a count would mislead. The flag
  reliably answers "were any comments/docstrings added in this commit."

---

## The optional note

When Claude activity is detected, the developer sees one prompt:

    Claude activity detected: 23 interactions across 2 session(s)
    Auto-categorised: file-edit(8), terminal(6), file-read(4), research(3), planning(2)
    Last session: Refactored payment handler, added null checks

    Note (optional — press Enter to skip): _

The developer types a short description ("security review on auth")
or presses Enter. Either way the commit proceeds.

Notes aggregate into a section in the weekly report — useful for
understanding *intent* behind the activity counts.

---

## One-time setup per developer

### 1. Configure the hooks path (run once per clone)

    git config core.hooksPath .githooks

Add to your team onboarding checklist. Must be run in the repo root.

### 2. Allow PowerShell execution (if blocked)

Run once in PowerShell (not as admin):

    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

### 3. Verify

Make a change, stage it, commit. Check the result:

    git log -1 --format="%B"

You should see AI-Usage trailers at the bottom of the commit message.

---

## CI enforcement (recommended)

Prevents `git commit --no-verify` bypass from reaching the PR.
Add to your existing PR workflow YAML:

```yaml
- name: Verify AI-Usage trailers present
  shell: bash
  run: |
    MISSING=""
    while IFS= read -r line; do
      hash=$(echo "$line" | cut -d' ' -f1)
      author=$(echo "$line" | cut -d' ' -f2-)
      body=$(git log -1 --format="%B" "$hash")
      if ! echo "$body" | grep -q "^AI-Usage:"; then
        MISSING="$MISSING\n  $author ($hash)"
      fi
    done < <(git log origin/main..HEAD --format="%H %ae" --no-merges)

    if [ -n "$MISSING" ]; then
      echo "Commits missing AI-Usage trailers:"
      printf "$MISSING\n\n"
      echo "Fix: ensure git config core.hooksPath .githooks is set in your clone."
      exit 1
    fi
```

---

## Weekly report

`.github/workflows/ai-usage-report.yml` runs every Monday 08:00 UTC.
It posts a GitHub Issue tagged `ai-usage-report` with two tables:

**Summary table** — one row per developer:
- Total commits, AI-assisted commits, percentage
- Session count and total interactions

**Activity breakdown** — one column per category:
- Raw interaction counts per developer per category
- Dashes where a category was not used

**Developer notes** — aggregated free-text notes from the week.

Previous week's report issue is automatically closed when the new
one is posted.

---

## Files in this solution

```
.githooks/
  commit-msg              ← git hook entry point (sh, calls PowerShell)
  append-ai-usage.ps1     ← reads JSONL logs, writes trailers, shows prompt
.github/
  workflows/
    ai-usage-report.yml   ← weekly report posted as GitHub Issue
AI-TRACKING-SETUP.md      ← this file
```

Commit all four files. `.githooks/` is version-controlled and shared
across the team. `.git/hooks/` is local only and not tracked.
