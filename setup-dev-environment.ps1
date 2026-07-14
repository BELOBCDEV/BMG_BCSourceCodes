# ============================================================================
# setup-dev-environment.ps1 — one-time per-clone activation for AI tracking
# ============================================================================
#
# Run this ONCE after cloning a tracked repo. Double-click it in File Explorer,
# or run it in a PowerShell prompt from the repo root.
#
# WHAT IT DOES (and why each step matters):
#   1. Points git at the in-repo hooks folder (.githooks). Without this, git
#      uses .git/hooks (empty) and the commit-msg hook never fires — so your
#      commits get NO AI-Usage trailers and you show up as "local-untracked"
#      (or invisible) in the weekly report.
#   2. Relaxes the PowerShell execution policy for the current user just enough
#      to let the hook script run. Fresh Windows installs default to
#      "Restricted", which would block append-ai-usage.ps1.
#
# This changes only THIS clone's git config and the CURRENT USER's PS policy.
# It does not touch system-wide settings or other repos.
# ============================================================================

Write-Host "Setting up developer environment..." -ForegroundColor Cyan

# Step 1 — route git hooks to the version-controlled .githooks/ folder.
# This is the single switch that turns tracking on for this clone.
git config core.hooksPath .githooks
Write-Host "  [OK] git hooks configured" -ForegroundColor Green

# Step 2 — ensure the hook is actually allowed to execute.
# Only raise the policy if it's currently blocking (Restricted/Undefined);
# leave an already-permissive policy untouched so we don't downgrade anyone.
$policy = Get-ExecutionPolicy -Scope CurrentUser
if ($policy -eq "Restricted" -or $policy -eq "Undefined") {
    # RemoteSigned = run local scripts freely, require a signature only for
    # scripts downloaded from the internet. Safe default for dev machines.
    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
    Write-Host "  [OK] PowerShell execution policy set" -ForegroundColor Green
} else {
    Write-Host "  [OK] PowerShell execution policy already set ($policy)" -ForegroundColor Green
}

Write-Host ""
Write-Host "Setup complete. AI usage tracking is active on this clone." -ForegroundColor Cyan
Write-Host ""
# Keep the window open when launched by double-click, so the dev sees the result.
Read-Host "Press Enter to close"
