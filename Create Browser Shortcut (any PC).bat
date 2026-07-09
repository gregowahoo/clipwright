@echo off
rem Puts a Clipwright browser shortcut on THIS computer's desktop.
rem Run it on any PC: if this folder lives on a mapped network drive
rem (e.g. Beast's C: mapped as D: on another machine), the shortcut
rem points at the machine that hosts the folder; run locally, it
rem points at this machine. The server must be running on the host PC.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$drive='%~d0'; $server=$env:COMPUTERNAME; $m = net use $drive 2>$null | Select-String 'Remote name'; if ($m) { $server = ($m.ToString() -split '\s+')[-1].Split('\')[2] }; $port=8321; $cfg = Join-Path '%~dp0' 'clipwright_config.json'; if (Test-Path $cfg) { try { $port = (Get-Content $cfg -Raw | ConvertFrom-Json).port } catch {} }; $desktop=[Environment]::GetFolderPath('Desktop'); $c='[InternetShortcut]' + [Environment]::NewLine + 'URL=http://' + $server + ':' + $port; Set-Content -Path (Join-Path $desktop 'Clipwright.url') -Value $c; Write-Host ('Desktop shortcut created -> http://' + $server + ':' + $port)"
pause
