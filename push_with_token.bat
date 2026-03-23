@echo off
echo ========================================
echo   GitHub令牌推送脚本
echo ========================================
echo.
echo 说明：使用GitHub Personal Access Token推送
echo.
echo 步骤：
echo 1. 访问 https://github.com/settings/tokens
echo 2. 生成新令牌，勾选 repo 权限
echo 3. 复制生成的令牌
echo.
echo 注意：令牌只会显示一次，请妥善保存
echo.

set /p token=请输入GitHub令牌: 

if "%token%"=="" (
    echo 错误：令牌不能为空
    pause
    exit /b 1
)

echo.
echo 配置Git使用令牌...
git remote set-url origin https://c18576473523-ops:%token%@github.com/c18576473523-ops/QQQ.git

echo.
echo 推送到GitHub...
git push origin main

echo.
echo 推送完成！
echo 注意：令牌已嵌入远程URL，建议推送后清除
echo 清除命令：git remote set-url origin https://github.com/c18576473523-ops/QQQ.git
echo.
pause