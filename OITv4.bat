@echo off
::Set window size:;
mode con cols=60 lines=13
cls

::Page 01::
echo =======================================================
echo          Office Install Tool v4 by SunnyChon
echo =======================================================
echo Wait for 5 seconds or press any key to continue.
timeout 5 >nul
cls

::Cheak Admin
echo =======================================================
echo          Office Install Tool v4 by SunnyChon
echo =======================================================
echo Cheaking admin...
net session >nul 2>&1
if %errorLevel% == 0 (
echo \\\\    \    \\\\  \\\\ & echo \   \  \ \  \     \ & echo \\\\  \\\\\  \\\   \\\ & echo \     \   \     \     \ & echo \     \   \ \\\\  \\\\ 
) else (
start cmd /c powershell /c Start-Process "%0" -Verb RunAs
exit
)
echo Installation will continue after 10 seconds,press any key to skip.
timeout 10>nul

::Install
cls
echo =======================================================
echo          Office Install Tool v4 by SunnyChon
echo =======================================================
echo Downloading Files...
echo Downloading Aria2(For faster downloading,Will save as aria2c.exe)...
powershell/c iwr -Uri "https://sunnychon.github.io/aria2c.exe" -OutFile "%tmp%\aria2c.exe" >nul 2>&1 || if NOT %errorlevel%==0 set errorcode=%errorlevel% & goto err
cls
echo =======================================================
echo          Office Install Tool v4 by SunnyChon
echo =======================================================
echo Downloading Files...
echo Downloading OfficeDeploymentTool... (setup.exe)
"%tmp%\aria2c" "https://sunnychon.github.io/setup.exe" -d "%tmp%" >nul 2>&1 || if NOT %errorlevel%==0 set errorcode=%errorlevel% & goto err
cls
echo =======================================================
echo          Office Install Tool v4 by SunnyChon
echo =======================================================
echo Downloading Files...
echo Downloading Office Configure XML File... (Cfg642021Full.xml)
"%tmp%\aria2c" "https://sunnychon.github.io/Cfg642021Full.xml" -d "%tmp%" >nul 2>&1 || if NOT %errorlevel%==0 set errorcode=%errorlevel% & goto err
cls
echo =======================================================
echo          Office Install Tool v4 by SunnyChon
echo =======================================================
echo Downloading Files...
echo Downloading Office Files...
cd /D "%tmp%"
setup.exe /download Cfg642021Full.xml || if NOT %errorlevel%==0 set errorcode=%errorlevel% & goto err
cls
echo =======================================================
echo          Office Install Tool v4 by SunnyChon
echo =======================================================
echo Installing...
setup.exe /configure Cfg642021Full.xml || if NOT %errorlevel%==0 set errorcode=%errorlevel% & goto err
cls
echo =======================================================
echo          Office Install Tool v4 by SunnyChon
echo =======================================================
echo Trying to active office... (KMS)
cd /d "%ProgramFiles%"
cd "Microsoft Office"
cd "Office16"
set kms_server=kms.ddns.net
:KMSRETRY
echo Using KMS server:%kms_server%
echo Setting HOST:%kms_server%
cscript //nologo ospp.vbs /sethst:%kms_server%>nul
echo Activating Office...
cscript //nologo ospp.vbs /act>nul||goto kms_failed
::install Completed and exit
echo Activation Completed.
goto end
:kms_failed
cls
echo =======================================================
echo          Office Install Tool v4 by SunnyChon
echo =======================================================
echo Failed to active office. Please use another KMS server.
set /p kms_server=KMS Server IP^>
goto KMSRETRY
:err
cls
echo =======================================================
echo          Office Install Tool v4 by SunnyChon
echo =======================================================
echo An error occurred(code %errorcode%) Press ENTER to exit.
set /p entertoexit=
exit
:end
cls
echo =======================================================
echo          Office Install Tool v4 by SunnyChon
echo =======================================================
echo Installation Completed! Press ENTER to exit.
set /p entertoexit=
exit