# 设置知识库自动同步计划任务
Write-Host "设置知识库自动同步..." -ForegroundColor Green

# 创建同步脚本
$syncScript = @'
cd /d "D:\MyKnowledgeBase"
git add .
git commit -m "自动同步: %date% %time%" 2>nul
git push origin main 2>nul
'@

$syncScriptPath = "D:\MyKnowledgeBase\auto_sync.cmd"
$syncScript | Out-File -FilePath $syncScriptPath -Encoding ASCII

# 创建计划任务
$taskName = "钦钦知识库自动同步"
$taskDescription = "每小时自动同步知识库到云端"

# 检查是否已存在
$existingTask = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
if ($existingTask) {
    Write-Host "计划任务已存在，更新中..." -ForegroundColor Yellow
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
}

# 创建新任务
$action = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "/c `"$syncScriptPath`""
$trigger = New-ScheduledTaskTrigger -Daily -At "00:00" -RepetitionInterval (New-TimeSpan -Hours 1) -RepetitionDuration (New-TimeSpan -Days 365)
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -RestartCount 3 -RestartInterval (New-TimeSpan -Minutes 5)

$task = New-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Description $taskDescription

Register-ScheduledTask -TaskName $taskName -InputObject $task

Write-Host "计划任务创建成功!" -ForegroundColor Green
Write-Host "任务名称: $taskName" -ForegroundColor Cyan
Write-Host "执行频率: 每小时一次" -ForegroundColor Cyan
Write-Host "脚本位置: $syncScriptPath" -ForegroundColor Cyan
Write-Host ""
Write-Host "注意: 需要先配置GitHub仓库远程地址" -ForegroundColor Yellow
Write-Host "运行: git remote add origin <你的仓库地址>" -ForegroundColor Yellow