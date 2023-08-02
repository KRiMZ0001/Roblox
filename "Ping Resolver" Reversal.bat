@echo off
netsh int tcp set global autotuninglevel=normal
netsh interface 6to4 set state default
netsh int isatap set state default
netsh int tcp set global timestamps=enabled
netsh int tcp set heuristics enabled
netsh int tcp set global chimney=enabled
netsh int tcp set global ecncapability=enabled
netsh int tcp set global rsc=enabled
netsh int tcp set global nonsackrttresiliency=enabled
netsh int tcp set security mpp=enabled
netsh int tcp set security profiles=enabled
netsh int ip set global icmpredirects=enabled
netsh int tcp set security mpp=enabled profiles=enabled
netsh int ip set global multicastforwarding=enabled
netsh int tcp set supplemental internet congestionprovider=default
netsh interface teredo set state default
netsh winsock reset
netsh int isatap set state default
netsh int ip set global taskoffload=enabled
netsh int ip set global neighborcachelimit=0
netsh int tcp set global dca=disabled
netsh int tcp set global netdma=disabled
PowerShell Enable-NetAdapterLso -Name "*"
powershell "ForEach($adapter In Get-NetAdapter){Enable-NetAdapterPowerManagement -Name $adapter.Name -WakeOnMagicPacket Enabled -WakeOnPattern Enabled -WakeOnMediaDisconnect Enabled -ErrorAction SilentlyContinue}"
powershell "ForEach($adapter In Get-NetAdapter){Enable-NetAdapterLso -Name $adapter.Name -ErrorAction SilentlyContinue}"

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "240" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "65535" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "8760" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "5000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "128" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "10" /f
echo.
pause
