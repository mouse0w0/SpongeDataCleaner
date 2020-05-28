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
echo Cleaning......

rem Vanilla
del /f /s /q crash-reports\
rd /s /q crash-reports\
del /f /s /q logs\
rd /s /q logs\
del /f /s /q world\
rd /s /q world\
del /f /s /q banned-ips.json
del /f /s /q banned-players.json
del /f /s /q ops.json
del /f /s /q usercache.json
del /f /s /q usernamecache.json
del /f /s /q whitelist.json

rem Sponge
del /f /s /q config\sponge\worlds\
rd /s /q config\sponge\worlds\

rem CarrotShop
del /f /s /q config\carrotshop\logs\
rd /s /q config\carrotshop\logs\
del /f /s /q config\carrotshop\shops.json

rem Nucleus
del /f /s /q nucleus\userdata\
rd /s /q nucleus\userdata\
del /f /s /q nucleus\worlddata\
rd /s /q nucleus\worlddata\
del /f /s /q nucleus\namebans.json
del /f /s /q nucleus\namebans.json.bak
del /f /s /q nucleus\nucleususercache.json
del /f /s /q nucleus\nucleususercache.json.bak

rem LuckPerms
del /f /s /q luckperms\sponge-data\
rd /s /q luckperms\sponge-data\
del /f /s /q luckperms\yaml-storage\
rd /s /q luckperms\yaml-storage\
del /f /s /q luckperms\contexts.json
del /f /s /q luckperms\luckperms-h2.mv.db

rem FlexibleLogin
del /f /s /q config\flexiblelogin\database.mv.db

rem GriefPrevention
del /f /s /q config\griefprevention\GlobalPlayerData\
rd /s /q config\griefprevention\GlobalPlayerData\
del /f /s /q config\griefprevention\Logs\
rd /s /q config\griefprevention\Logs\
del /f /s /q config\griefprevention\worlds\minecraft\
rd /s /q config\griefprevention\worlds\minecraft\

rem HologramsPlus
del /f /s /q config\hologramsplus.conf

rem Latch
del /f /s /q config\latch\latch.mv.db

rem Prism
del /f /s /q config\prism\prism.mv.db
del /f /s /q config\prism\prism.trace.db

rem ProjectPortals
del /f /s /q config\pjp\pjp.mv.db

rem TotalEconomy
del /f /s /q  config\totaleconomy\accounts.conf

rem END
echo Completed Clean :)

:exit
pause
