@echo off
echo RDP CREATION SUCCESSFUL!
tasklist | find /i "ngrok.exe" >nul && goto check || (
    echo Unable to get NGROK tunnel. Make sure NGROK_AUTH_TOKEN is correct in Secrets.
    echo Maybe your previous VM is still running: https://dashboard.ngrok.com/status/tunnels
    ping 127.0.0.1 >nul
    exit
)

:check
cls
echo RDP CREATION SUCCESSFUL!
echo Time: %TIME%   Date: %DATE%
timeout /t 3 >nul
goto check
