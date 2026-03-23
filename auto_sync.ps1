# 知识库自动同步脚本
Write-Host "知识库自动同步到GitHub" -ForegroundColor Green
Write-Host "时间: $(Get-Date)" -ForegroundColor Cyan
Write-Host ""

Set-Location "D:\MyKnowledgeBase"

Write-Host "1. 检查更改..." -ForegroundColor Yellow
git status --short

Write-Host ""
Write-Host "2. 添加所有更改..." -ForegroundColor Yellow
git add .

Write-Host ""
Write-Host "3. 提交更改..." -ForegroundColor Yellow
git commit -m "自动同步: $(Get-Date)" 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ 有更改已提交" -ForegroundColor Green
} else {
    Write-Host "ℹ️ 没有需要提交的更改" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "4. 推送到GitHub..." -ForegroundColor Yellow
git push origin main 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ 推送成功！" -ForegroundColor Green
} else {
    Write-Host "❌ 推送失败，请检查网络和认证" -ForegroundColor Red
}

Write-Host ""
Write-Host "同步完成！" -ForegroundColor Green
Write-Host "可以设置计划任务每小时自动运行此脚本" -ForegroundColor Cyan