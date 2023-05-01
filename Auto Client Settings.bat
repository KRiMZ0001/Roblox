--// still testing

@echo off
setlocal EnableDelayedExpansion

set user=%USERNAME%
set versions_dir=C:\Users\!user!\AppData\Local\Roblox\Versions

for /f "delims=" %%i in ('dir /b /a:d /od "!versions_dir!"') do set latest_version=%%i

set dir=!versions_dir!\!latest_version!\ClientSettings

if not exist "!dir!" (
    mkdir "!dir!"
    cd "!dir!"
    curl -o ClientAppSettings.json https://raw.githubusercontent.com/L8X/Roblox-Client-Optimizer/main/ClientAppSettings.json
    echo ClientSettings Added
    pause
) else (
    if not exist "!dir!\ClientAppSettings.json" (
        cd "!dir!"
        curl -o ClientAppSettings.json https://raw.githubusercontent.com/L8X/Roblox-Client-Optimizer/main/ClientAppSettings.json
        echo ClientAppSettings Added
        pause
    )
)
