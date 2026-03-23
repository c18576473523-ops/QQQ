@echo off
echo ========================================
echo   知识库云端同步脚本
echo ========================================
echo.
echo 同步时间: %date% %time%
echo.

cd /d "D:\MyKnowledgeBase"

echo 1. 检查Git状态...
git status

echo.
echo 2. 添加更改...
git add .

echo.
echo 3. 提交更改...
git commit -m "自动同步: %date% %time%" || echo 没有更改需要提交

echo.
echo 4. 推送到云端...
echo 注意: 需要先配置GitHub仓库地址
echo 运行: git remote add origin <你的仓库地址>
echo.

echo 同步完成!
echo.
pause