@echo off
echo ========================================
echo   Knowledge Base Auto Sync to GitHub
echo   Time: %date% %time%
echo ========================================
echo.

cd /d "D:\MyKnowledgeBase"

echo 1. Checking for changes...
git status --short

echo.
echo 2. Adding all changes...
git add .

echo.
echo 3. Committing changes...
git commit -m "Auto sync: %date% %time%" >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Changes committed
) else (
    echo ℹ️ No changes to commit
)

echo.
echo 4. Pushing to GitHub...
git push origin main >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Push successful!
) else (
    echo ❌ Push failed, check network/auth
)

echo.
echo Sync completed!
echo You can schedule this script to run hourly.