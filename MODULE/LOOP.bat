@echo off
REM Cek apakah proses ngrok sedang berjalan
tasklist | find /i "ngrok.exe" >nul
if %errorlevel% neq 0 (
    echo Ngrok is not running.
    echo Please make sure NGROK_AUTH_TOKEN is correct in GitHub Secrets.
    echo Or visit: https://dashboard.ngrok.com/status/tunnels
    exit
)

:monitor
cls
echo RDP is active.
echo Time: %TIME%    Date: %DATE%
echo Checking Ngrok tunnel...

REM Ambil informasi tunnel menggunakan curl
curl -s http://127.0.0.1:4040/api/tunnels > tunnel.json
type tunnel.json

REM Delay agar loop tidak memberatkan CPU
ping -n 4 127.0.0.1 >nul
goto monitor
