#!/bin/sh
# ============================================================================
# setup-dev-environment.sh — one-time per-clone activation (macOS / Linux)
# ============================================================================
# Shell equivalent of setup-dev-environment.ps1, for developers who don't have
# (or haven't yet installed) PowerShell. Run once from the repo root:
#     ./setup-dev-environment.sh
# ============================================================================

echo "Setting up developer environment..."

# The single switch that turns tracking on for this clone: route git hooks to
# the version-controlled .githooks/ folder.
git config core.hooksPath .githooks
echo "  [OK] git hooks configured (core.hooksPath = .githooks)"

# The tracking script runs under PowerShell 7+. Warn (don't fail) if it's
# missing — commits will still work, they just won't be tracked until pwsh is
# installed.
if command -v pwsh >/dev/null 2>&1 || command -v pwsh-preview >/dev/null 2>&1; then
  echo "  [OK] PowerShell found — AI usage tracking is active on this clone."
else
  echo "  [!]  PowerShell (pwsh) not found. Install it to enable tracking:"
  echo "         macOS:  brew install powershell"
  echo "         Linux:  https://learn.microsoft.com/powershell/scripting/install/"
  echo "       Commits will still succeed; they just won't carry AI-Usage trailers."
fi

echo ""
echo "Setup complete."
