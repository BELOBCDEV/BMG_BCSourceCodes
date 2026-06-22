# GitHub Developer Workflow — Belo-Medical-Group

How we work in GitHub so that (a) central always reflects what everyone is
doing, and (b) your AI-usage and code stats are captured. Read this once; the
habits take five minutes to learn.

**The one thing that matters most:** work from a **clone on your machine** and
**commit there**. Editing in the GitHub website skips the tracking hook, so that
work is invisible in the weekly report.

---

## The four golden rules

1. **Commit locally** (in your clone), never with the GitHub "Edit this file"
   button. Each local commit captures your stats.
2. **Push often** — at least once a day. Central should never be more than a day
   behind your laptop.
3. **Pull before you start and before you push** — stay current, avoid conflicts.
4. **Never** use `git commit --no-verify` — it skips tracking.

> Your work is counted as soon as it's pushed to **any branch** — it does **not**
> need to reach `main`. So push freely.

---

## How your stats flow

```
edit in IDE → git commit (LOCAL) ✨ stats captured → git push (any branch) 🏁 counted in weekly report
```

- Stats live inside each commit (as message "trailers") — permanent, never overwritten.
- The weekly report sums the last 7 days across **all branches**.
- Squash-merge is **disabled org-wide** so merging never throws your stats away.
  Use **"Create a merge commit"** or **"Rebase and merge"** on PRs.

---

## Daily commands (the only six you need)

```sh
git clone <repo-url>          # once, to get the repo on your machine
git pull                      # get the latest before you work / before you push
git checkout -b feature/x     # make a branch to work on
git add .                     # stage your changes
git commit -m "message"       # COMMIT LOCALLY — stats captured here
git push                      # send your branch to central (check-in)
```

First time in a clone, switch tracking on once:
`setup-dev-environment.ps1` (Windows) or `./setup-dev-environment.sh` (Mac/Linux).

Check it's working any time: `git log -1 --format=%B` → you should see `AI-Usage:`
lines at the bottom.

---

## Choose your branching pattern

Use the **simple** pattern for small, early, or solo projects. Use the
**pipeline** pattern for anything heading to production.

### Pattern A — Simple (feature → main)

Best for: small tools, prototypes, single-developer repos.

```
main  ── the working version (protected: changes only via PR)
 ▲
 └─ feature/<name>  ── you work here, commit locally, push daily, then PR → main
```

Flow:
1. `git checkout -b feature/x` off `main`.
2. Work locally, commit often, push daily.
3. Open a PR `feature/x → main`. Get a review. Merge (merge-commit or rebase).

### Pattern B — Pipeline (feature → dev → uat → main)

Best for: anything that goes through testing into production. Each branch is an
**environment**.

```
main  ── PRODUCTION-approved only. Protected. PR + review to enter.
 ▲
uat   ── under test / staging. Protected. PR from dev.
 ▲
dev   ── everyone's work integrated. Protected. PR from feature branches.
 ▲
 └─ feature/<name>  ── you work here, commit locally, push daily, then PR → dev
```

Flow:
1. Branch `feature/x` off **`dev`**.
2. Work locally, commit often, push daily. (Already counted in the report.)
3. PR `feature/x → dev`. Review, merge.
4. Promote when ready: PR `dev → uat` (test there), then `uat → main`
   (production) — each with review.

> Whichever pattern, **`main` is never edited directly** and **never the place
> you "push to be counted."** You're counted on your feature branch already.

---

## Working with others on the same code (occasional)

- Default: **one feature branch per person** → almost no conflicts. Integrate via
  PR into `dev` (or `main` for Pattern A).
- If two of you must share a branch: **pull before every push**, commit small and
  often, and resolve conflicts locally before pushing.
- Protected branches (`dev`/`uat`/`main`) require a PR + review, so nothing lands
  unseen.

---

## Do / Don't

✅ Do
- Clone and work locally; commit often; push at least daily.
- Use branches and pull requests.
- Pull before you push.
- Merge PRs with **merge-commit** or **rebase**.

❌ Don't
- Edit or commit in the GitHub website (pencil icon / "Commit suggestion").
- `git commit --no-verify`.
- Commit straight to `main` (or `dev`/`uat`) — always via a PR.
- Force-push shared branches.

---

## Quick reference

| I want to… | Do this |
|------------|---------|
| Start new work | `git pull` then `git checkout -b feature/x` |
| Save progress (stats captured) | `git add .` && `git commit -m "..."` |
| Send it to central | `git push` |
| Get others' latest | `git pull` |
| Confirm I'm tracked | `git log -1 --format=%B` shows `AI-Usage:` |
| Get my work into the next environment | open a Pull Request |

Setup help: `AI-TRACKING-SETUP.md` · committing details: `HOW-TO-COMMIT.md`.
