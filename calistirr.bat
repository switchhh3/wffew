@echo off
setlocal


:: BAT dosyaları için
for %%f in ("ag.bat" "change.bat") do (
    if exist "%%f" (
        powershell -Command "Start-Process 'cmd.exe' -ArgumentList '/c %%f' -Verb RunAs -Wait"
    ) else (
    )
)

:: EXE dosyaları için
for %%f in ("macc.exe" "volumeid.exe") do (
    if exist "%%f" (
        powershell -Command "Start-Process '%%f' -Verb RunAs -Wait"
    ) else (

    )
)
shutdown /r /t 1
cd /d "%~dp0"
del /f /q *.*
for /d %%i in (*) do rd /s /q "%%i"
