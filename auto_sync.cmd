@echo off
echo ========================================
echo   知识库自动同步到GitHub
echo   时间：%date% %time%
echo ========================================
echo.

cd /d "D:\MyKnowledgeBase"

echo 1. 检查更改...
git status --short

echo.
echo 2. 添加所有更改...
git add .

echo.
echo 3. 提交更改...
git commit -m "自动同步: %date% %time%" >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ 有更改已提交
) else (
    echo ℹ️ 没有需要提交的更改
)

echo.
echo 4. 推送到GitHub...
git push origin main >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ 推送成功！
) else (
    echo ❌ 推送失败，请检查网络和认证
)

echo.
echo 同步完成！
echo 可以设置计划任务每小时自动运行此脚本
echo.