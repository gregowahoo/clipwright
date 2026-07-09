@echo off
title Clipwright Launcher
cd /d "%~dp0"

rem If the server is already running, just open the browser
powershell -NoProfile -Command "$c = New-Object Net.Sockets.TcpClient; try { $c.Connect('127.0.0.1', 8321); exit 0 } catch { exit 1 }" >nul 2>&1
if %errorlevel%==0 (
    start "" http://127.0.0.1:8321
    exit /b
)

echo Starting Clipwright...
start "Clipwright server - keep this window open" cmd /k python -m clipwright
timeout /t 3 /nobreak >nul
start "" http://127.0.0.1:8321
exit /b
