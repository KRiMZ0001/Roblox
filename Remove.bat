@echo off
setlocal EnableDelayedExpansion

set user=%USERNAME%
set versions_dir=C:\Users\!user!\AppData\Local\Roblox\Versions

for /d %%i in ("%versions_dir%\*") do (
    set "dir=%%i\ClientSettings"
    if exist "!dir!" (
        echo Deleting !dir!
        rmdir /s /q "!dir!"
    )
)

echo Done.
pause
