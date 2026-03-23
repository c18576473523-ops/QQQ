@echo off
echo 尝试直接推送到GitHub...
echo.

cd /d "D:\MyKnowledgeBase"

echo 当前状态：
git status

echo.
echo 添加所有更改...
git add .

echo.
echo 提交更改...
git commit -m "手动同步: %date% %time%"

echo.
echo 推送到GitHub...
echo 注意：如果弹出凭据窗口，请输入GitHub用户名和密码
git push origin main

echo.
if %errorlevel% equ 0 (
    echo ✅ 推送成功！
) else (
    echo ❌ 推送失败
    echo 可能的原因：
    echo 1. 需要输入GitHub凭据
    echo 2. 网络连接问题
    echo 3. 权限不足
)

echo.
pause