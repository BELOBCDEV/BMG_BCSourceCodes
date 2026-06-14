# setup-dev-environment.ps1
# Run once after cloning. Double-click in File Explorer or run in PowerShell.

Write-Host "Setting up developer environment..." -ForegroundColor Cyan

git config core.hooksPath .githooks
Write-Host "  [OK] git hooks configured" -ForegroundColor Green

$policy = Get-ExecutionPolicy -Scope CurrentUser
if ($policy -eq "Restricted" -or $policy -eq "Undefined") {
    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
    Write-Host "  [OK] PowerShell execution policy set" -ForegroundColor Green
} else {
    Write-Host "  [OK] PowerShell execution policy already set ($policy)" -ForegroundColor Green
}

Write-Host ""
Write-Host "Setup complete. AI usage tracking is active on this clone." -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to close"
