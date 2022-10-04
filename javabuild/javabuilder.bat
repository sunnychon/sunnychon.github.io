@echo off
del /f lnm.txt
set lognum=%random%
echo %lognum% > lnm.txt
start logview.bat
:start
echo [info][%time%]starting >> logs/javabuilder%lognum%.log
echo [info][%time%]started >> logs/javabuilder%lognum%.log
cls
echo [info][%time%]asking >> logs/javabuilder%lognum%.log
echo did you install jdk?
choice
if %errorlevel%==1 goto helppage
if %errorlevel%==2 goto djdk
:helppage
cls
echo do you need to read usage
choice
if %errorlevel%==1 goto usage
if %errorlevel%==2 goto build
:usage
#usage page
:p1
cls
echo you need to type like this : 
echo "javafilename"
choice -m 1/2 -c 02
if %errorlevel%==1 goto start
if %errorlevel%==2 goto p2
:p2
cls
echo if your java filename is file.java then type:
echo "file"
choice -m 2/3 -c 13
if %errorlevel%==1 goto p1
if %errorlevel%==2 goto p3
:p3
cls
echo than save
choice -m 3/3 -c 20
if %errorlevel%==1 goto p2
if %errorlevel%==2 goto build
:build
cls
notepad javafilename.txt
echo שÝשששששששששששששששששששששששששששששששששששß
echo שרjava builder     שר
echo שרv1               שר
echo שר                 שר
echo שדשששששששששששששששששששששששששששששששששששו
title start in 3 s
timeout 1 >>cache01
title start in 2 s
timeout 1 >>cache01
title start in 1 s
timeout 1 >>cache01

echo [info][%time%]building >> logs/javabuilder%lognum%.log
title building...


echo username : %username%


for /f %%i in (javafilename.txt)  do (
set Javafile=%%i
) 

echo [info][%time%]setting filename %Javafile% >> logs/javabuilder%lognum%.log

title running javac.exe
echo [info][%time%]running javac >> logs/javabuilder%lognum%.log
javac javacodefile/%Javafile% -d classoutput
title build finished
echo [info][%time%]build finished >> logs/javabuilder%lognum%.log

title finished
timeout 1 >> cache01
title you can close this window now. auto exit in 10 sec.
timeout 1 >> cache01
title you can close this window now. auto exit in 9 sec.
timeout 1 >> cache01
title you can close this window now. auto exit in 8 sec.
timeout 1 >> cache01
title you can close this window now. auto exit in 7 sec.
timeout 1 >> cache01
title you can close this window now. auto exit in 6 sec.
timeout 1 >> cache01
title you can close this window now. auto exit in 5 sec.
timeout 1 >> cache01
title you can close this window now. auto exit in 4 sec.
timeout 1 >> cache01
title you can close this window now. auto exit in 3 sec.
timeout 1 >> cache01
title you can close this window now. auto exit in 2 sec.
timeout 1 >> cache01
title you can close this window now. auto exit in 1 sec.

echo [info][%time%]clearing cache >> logs/javabuilder%lognum%.log
del /f cache01
echo [info][%time%]clear finished >> logs/javabuilder%lognum%.log
echo [info][%time%][exiting] this tool is made by sunnychon >> logs/javabuilder%lognum%.log
echo [info][%time%][exiting] see you next time! >> logs/javabuilder%lognum%.log
echo [info][%time%]exited >> logs/javabuilder%lognum%.log
cd logs
del /f cache01
exit


:djdk
start https://www.oracle.com/java/technologies/downloads/
goto start