@echo off
title RDP STATUS MONITOR - SAHRUL GUNAWAN
color 0A

tasklist | find /i "ngrok.exe" >nul && goto monitor

echo NGROK NOT DETECTED!
echo Make sure NGROK_AUTH_TOKEN is correct.
echo Or check: https://dashboard.ngrok.com/status/tunnels
ping 127.0.0.1 >nul
exit

:monitor
cls
echo RDP CREATION SUCCESSFUL!
echo Time: %TIME%   Date: %DATE%
echo Checking Ngrok Tunnel...

REM Cek alamat tunnel
curl -s http://127.0.0.1:4040/api/tunnels > tunnel.txt
type tunnel.txt

timeout /t 5 >nul
goto monitor
