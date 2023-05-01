@echo off
setlocal EnableDelayedExpansion

set user=%USERNAME%
set versions_dir=C:\Users\!user!\AppData\Local\Roblox\Versions

:loop
for /f "delims=" %%i in ('dir /b /a:d /od "!versions_dir!"') do (
    if not "%%i"=="!latest_version!" (
        set latest_version=%%i
        set dir=!versions_dir!\!latest_version!\ClientSettings
        mkdir "!dir!" 2>nul
        cd "!dir!"
        echo {} > settings.json
        echo Added settings for version !latest_version!
    )
)
timeout /t 60 /nobreak >nul
goto loop