@echo off
setlocal

:: Set paths for the files and icon
set "scriptPath=%~dp0The Hobbit Kingjoyer Edition.bat"
set "dxwndPath=%~dp0DxWnd\dxwnd.exe"
set "iconPath=%~dp0Meridian.ico"

:: Set desktop path for The Hobbit shortcut
set "desktop=%USERPROFILE%\Desktop"

:: Create a shortcut for The Hobbit Kingjoyer Edition.bat on the desktop with a custom icon
call :createShortcut "%scriptPath%" "%desktop%\The Hobbit Kingjoyer Edition.lnk" "%iconPath%"

:: Create a shortcut for dxwnd.exe in the same folder as the batch script (without custom icon)
call :createShortcut "%dxwndPath%" "%~dp0dxwnd.lnk"

echo Shortcuts created successfully.
pause
goto :eof

:createShortcut
:: Parameters: %1 - target file path, %2 - shortcut path, %3 - (optional) icon path
set "WScriptFile=%temp%\CreateShortcut.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%WScriptFile%"
echo sLinkFile = "%~2" >> "%WScriptFile%"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%WScriptFile%"
echo oLink.TargetPath = "%~1" >> "%WScriptFile%"
if "%~3" NEQ "" echo oLink.IconLocation = "%~3" >> "%WScriptFile%"
echo oLink.Save >> "%WScriptFile%"
cscript //nologo "%WScriptFile%"
del "%WScriptFile%"
goto :eof
