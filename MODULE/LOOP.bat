@echo off
title 🚪 RDP STATUS MONITOR - SAHRUL GUNAWAN
color 0A

REM 🎯 Cek apakah ngrok aktif
tasklist | find /i "ngrok.exe" >nul && goto monitor || (
    echo ⚠️ NGROK NOT DETECTED!
    echo 🔒 Make sure NGROK_AUTH_TOKEN is correct in Secrets.
    echo 💡 Or check: https://dashboard.ngrok.com/status/tunnels
    ping 127.0.0.1 >nul
    exit
)

:monitor
cls
echo ✅ RDP CREATION SUCCESSFUL!
echo 🕒 Time: %TIME%   📅 Date: %DATE%
echo 🌐 Checking Ngrok Tunnel...

REM 🌐 Cek alamat publik tunnel via curl
curl -s http://127.0.0.1:4040/api/tunnels | jq -r .tunnels[0].public_url

REM ⏳ Delay loop agar tidak membebani sistem
timeout /t 5 >nul
goto monitor
