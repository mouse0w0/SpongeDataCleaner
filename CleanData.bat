@echo off
echo -------------------------------------------------
echo Sponge Data Cleaner
echo Author: Mouse0w0
echo -------------------------------------------------
echo Are you confirm to clean up the server data? (Yes: Y, No: N)
set /p confirm=

if "%confirm%" == "Y" goto doClean
goto exit

:doClean
echo «Â¿Ì÷–°≠°≠

rem DoVanillaClean
del /f /s /q crash-reports
rd /s /q crash-reports
del /f /s /q logs
rd /s /q logs
del /f /s /q world
rd /s /q world
del /f /s /q banned-ips.json
del /f /s /q banned-players.json
del /f /s /q ops.json
del /f /s /q usercache.json
del /f /s /q whitelist.json

:exit
pause