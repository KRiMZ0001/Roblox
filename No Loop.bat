@echo off
setlocal EnableDelayedExpansion

set user=%USERNAME%
set versions_dir=C:\Users\!user!\AppData\Local\Roblox\Versions

for /f "delims=" %%i in ('dir /b /a:d /od "!versions_dir!"') do set latest_version=%%i

set dir=!versions_dir!\!latest_version!\ClientSettings

mkdir "!dir!"
cd "!dir!"

curl -o ClientAppSettings.json https://raw.githubusercontent.com/L8X/Roblox-Client-Optimizer/main/ClientAppSettings.json

echo Done.
pause