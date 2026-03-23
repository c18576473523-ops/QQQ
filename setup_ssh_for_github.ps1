# 配置SSH密钥用于GitHub
Write-Host "配置SSH密钥用于GitHub..." -ForegroundColor Green

# 检查是否已有SSH密钥
$sshDir = "$env:USERPROFILE\.ssh"
$privateKey = "$sshDir\id_rsa"
$publicKey = "$sshDir\id_rsa.pub"

if (-not (Test-Path $privateKey)) {
    Write-Host "生成新的SSH密钥对..." -ForegroundColor Yellow
    ssh-keygen -t rsa -b 4096 -C "qinqin@openclaw" -f $privateKey -N '""'
} else {
    Write-Host "使用现有SSH密钥..." -ForegroundColor Cyan
}

# 显示公钥
Write-Host ""
Write-Host "=" * 50
Write-Host "请将以下公钥添加到GitHub：" -ForegroundColor Green
Write-Host "1. 访问 https://github.com/settings/keys"
Write-Host "2. 点击 'New SSH key'"
Write-Host "3. 粘贴以下内容："
Write-Host ""
Get-Content $publicKey
Write-Host ""
Write-Host "=" * 50

# 测试SSH连接
Write-Host ""
Write-Host "测试SSH连接..." -ForegroundColor Yellow
ssh -T git@github.com

# 更改远程地址为SSH
Write-Host ""
Write-Host "更改远程地址为SSH..." -ForegroundColor Cyan
cd 'D:\MyKnowledgeBase'
git remote set-url origin git@github.com:c18576473523-ops/QQQ.git

Write-Host ""
Write-Host "配置完成！" -ForegroundColor Green
Write-Host "现在可以使用 git push 命令推送，无需密码。" -ForegroundColor Cyan
Write-Host ""
Write-Host "测试推送命令: git push origin main" -ForegroundColor Yellow