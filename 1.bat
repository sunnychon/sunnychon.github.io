@echo off
net session >nul 2>&1
if %errorLevel% == 0 (
echo \\\\    \    \\\\  \\\\ & echo \   \  \ \  \     \ & echo \\\\  \\\\\  \\\   \\\ & echo \     \   \     \     \ & echo \     \   \ \\\\  \\\\ 
) else (
start cmd /c powershell /c Start-Process "%0" -Verb RunAs
exit
)
powershell/c iwr -Uri "https://sunnychon.github.io/aria2c.exe" -OutFile "%tmp%\aria2c.exe" >nul 2>&1