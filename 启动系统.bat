@echo off
title 商品管理系统启动器
color 0A
mode con cols=60 lines=20

echo.
echo  ====================================
echo     商品管理系统 启动器
echo  ====================================
echo.

cd /d "%~dp0api"

echo [1/3] 检查 Node.js...
node --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] 未安装 Node.js，请先安装
    pause
    exit /b 1
)

echo [2/3] 启动 API 服务 (端口 3000)...
start "ShopAPI" node server.js
timeout /t 2 /nobreak >nul

echo [3/3] 打开管理后台...
start "" "http://localhost:3000"

echo.
echo ====================================
echo  启动完成！
echo.
echo  - API服务: http://localhost:3000
echo  - 管理后台: http://localhost:3000/admin/index.html
echo  - 小程序: http://localhost:3000/miniapp/index.html
echo.
echo  按任意键打开浏览器预览...
echo ====================================
pause >nul

start http://localhost:3000/admin/index.html
start http://localhost:3000/miniapp/index.html

echo.
echo 已打开浏览器，请刷新页面查看效果
pause
