@echo off
echo Installing WSL + Debian...
echo.
wsl --install -d Debian

echo.
echo Installation finished. Verifying status...
echo ========================================
wsl --status
echo.
wsl --list --verbose
echo ========================================
pause
