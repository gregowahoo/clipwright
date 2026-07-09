@echo off
rem Creates a "Clipwright" shortcut on your Desktop pointing at Start Clipwright.bat
powershell -NoProfile -Command ^
  "$ws = New-Object -ComObject WScript.Shell;" ^
  "$lnk = $ws.CreateShortcut((Join-Path ([Environment]::GetFolderPath('Desktop')) 'Clipwright.lnk'));" ^
  "$lnk.TargetPath = '%~dp0Start Clipwright.bat';" ^
  "$lnk.WorkingDirectory = '%~dp0';" ^
  "$lnk.Description = 'Clipwright - story-driven video studio for ComfyUI';" ^
  "$lnk.IconLocation = '%SystemRoot%\System32\imageres.dll,262';" ^
  "$lnk.Save()"
if %errorlevel%==0 (
    echo Done - look for "Clipwright" on your Desktop.
) else (
    echo Something went wrong creating the shortcut.
)
pause
