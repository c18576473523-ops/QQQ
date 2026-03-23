# Auto sync script
Write-Host "Auto syncing to GitHub..." -ForegroundColor Green
Write-Host "Time: $(Get-Date)" -ForegroundColor Cyan
Write-Host ""

Set-Location "D:\MyKnowledgeBase"

Write-Host "1. Checking changes..." -ForegroundColor Yellow
git status --short

Write-Host ""
Write-Host "2. Adding changes..." -ForegroundColor Yellow
git add .

Write-Host ""
Write-Host "3. Committing..." -ForegroundColor Yellow
git commit -m "Auto sync: $(Get-Date)" 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "OK - Changes committed" -ForegroundColor Green
} else {
    Write-Host "Info - No changes" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "4. Pushing to GitHub..." -ForegroundColor Yellow
git push origin main 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "OK - Push successful" -ForegroundColor Green
} else {
    Write-Host "Error - Push failed" -ForegroundColor Red
}

Write-Host ""
Write-Host "Sync completed!" -ForegroundColor Green