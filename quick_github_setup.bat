@echo off
echo ========================================
echo   快速GitHub设置向导
echo ========================================
echo.
echo 步骤1：生成GitHub令牌
echo 请访问：https://github.com/settings/tokens
echo 点击 "Generate new token"
echo 勾选 "repo" 权限
echo 生成后复制令牌（只会显示一次）
echo.
pause

echo.
echo 步骤2：使用令牌配置Git
set /p token=请输入GitHub令牌: 

if "%token%"=="" (
    echo 错误：令牌不能为空
    pause
    exit /b 1
)

echo.
echo 配置远程仓库使用令牌...
git remote set-url origin https://c18576473523-ops:%token%@github.com/c18576473523-ops/QQQ.git

echo.
echo 步骤3：推送到GitHub
git push origin main

echo.
if %errorlevel% equ 0 (
    echo ✅ 推送成功！
    echo.
    echo 步骤4：恢复原始URL（安全）
    git remote set-url origin https://github.com/c18576473523-ops/QQQ.git
    echo 原始URL已恢复
) else (
    echo ❌ 推送失败，请检查令牌
)

echo.
echo 步骤5：测试自动同步
echo 创建自动同步脚本...
(
echo @echo off
echo cd /d "D:\MyKnowledgeBase"
echo git add .
echo git commit -m "自动同步: %%date%% %%time%%" 2^>nul
echo git push origin main 2^>nul
) > auto_sync.cmd

echo 自动同步脚本已创建：auto_sync.cmd
echo.
echo 可以手动运行此脚本测试同步
echo.
pause