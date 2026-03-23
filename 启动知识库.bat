@echo off
echo ========================================
echo   钦钦的个人知识库 - 启动脚本
echo ========================================
echo.
echo 知识库位置: D:\MyKnowledgeBase
echo.
echo 请选择操作:
echo 1. 使用 Obsidian 打开知识库
echo 2. 打开知识库文件夹
echo 3. 查看 README
echo 4. 退出
echo.

set /p choice=请输入选择 (1-4): 

if "%choice%"=="1" (
    echo 正在打开 Obsidian...
    start "" "D:\MyKnowledgeBase"
    echo 如果 Obsidian 未安装，请先安装: https://obsidian.md
) else if "%choice%"=="2" (
    echo 打开文件夹...
    explorer "D:\MyKnowledgeBase"
) else if "%choice%"=="3" (
    echo 打开 README...
    start "" "D:\MyKnowledgeBase\README.md"
) else if "%choice%"=="4" (
    echo 退出...
) else (
    echo 无效选择
)

echo.
pause