# Belo Project Template

Standard starting point for new Belo-Medical-Group repositories. Creating a
repo from this template gives you a baseline of tooling and conventions
already in place.

## What you get

- **AI usage tracking** — git hooks that record AI usage and code metrics
  in every commit (`.githooks/`). Reporting is centralised: a single weekly
  workflow in the `ai-usage-tracking` repo scans all production repos and
  posts one consolidated report. Individual repos do NOT run their own report
  (keeps Actions minutes low).
- **CI enforcement** — `ci-ai-usage-check.yml` blocks PRs whose commits
  skip the tracking hook. This is the only workflow that runs per-repo, and
  only on pull requests.
- **Review controls** — `CODEOWNERS` and a PR template.
- **Security baseline** — `SECURITY.md`, `dependabot.yml`, and a `.gitignore`
  that keeps secrets and OS junk out.

## First steps after creating a repo from this template

1. **Developers (Windows):** after cloning, run `setup-dev-environment.ps1`
   once. See `AI-TRACKING-SETUP.md`.
2. **Maintainer:** edit `.github/CODEOWNERS` to point at the right team or
   people, and adjust `.github/dependabot.yml` for the project's stack.

## Controls applied automatically

Branch protection, required reviews, required status checks, and secret
scanning are enforced by the **organisation ruleset**, not by files in this
template — so they apply to this repo automatically without per-repo setup.
