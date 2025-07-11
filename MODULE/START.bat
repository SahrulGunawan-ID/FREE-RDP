@echo off
REM 🔧 Hapus shortcut Epic Games (abaikan error jika tidak ada)
if exist "C:\Users\Public\Desktop\Epic Games Launcher.lnk" (
    del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" >nul 2>&1
)

REM 📝 Tambahkan komentar ke server
net config server /srvcomment:"SERVER RDP BY SAHRUL GUNAWAN CYBER" >nul 2>&1

REM 🔒 Nonaktifkan tray auto-hide
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F >nul 2>&1

REM 🖼️ Tambahkan wallpaper autorun ke registry (gunakan direktori user agar tidak gagal)
set "WALLPATH=%USERPROFILE%\wallpaper.bat"
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v Wallpaper /t REG_SZ /d "%WALLPATH%" >nul 2>&1

REM 👤 Aktifkan akun administrator dan atur password
net user administrator @SahrulGun123 /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul

REM 🧹 Hapus user "installer" jika ada
net user installer >nul 2>&1 && net user installer /delete >nul

REM 💽 Aktifkan monitoring disk
diskperf -Y >nul

REM 🔊 Autostart audio service
sc config Audiosrv start= auto >nul
sc start Audiosrv >nul

REM 🔐 Beri akses penuh ke folder penting
ICACLS C:\Windows\Temp /grant administrator:F /t >nul
ICACLS C:\Windows\installer /grant administrator:F /t >nul

REM 📢 Informasi Sukses & Detail RDP
echo.
echo 💡 Successfully Installed! If the RDP is dead, please rebuild again!
echo 🔑 Username: administrator
echo 🔒 Password: @SahrulGun123
echo 🚪 Login via RDP now!

REM 🌐 Tampilkan IP atau status Ngrok Tunnel
timeout /t 5 >nul
tasklist | find /i "ngrok.exe" >nul && (
    echo 🌐 IP:
    curl -s http://127.0.0.1:4040/api/tunnels | jq -r .tunnels[0].public_url
) || (
    echo ⚠️ Unable to get the NGROK tunnel.
    echo Make sure NGROK_AUTH_TOKEN is correct in Settings > Secrets > Repository secret.
    echo Maybe your previous VM is still running: https://dashboard.ngrok.com/status/tunnels
)
