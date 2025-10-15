
@echo off
REM --- Comandos Originais e Renomeacao ---
WMIC computersystem where name="%computername%" call rename Name="DESKTOP-CF71C55"
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName" /v ComputerName /t REG_SZ /d "DESKTOP-CF71C55" /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName" /v ComputerName /t REG_SZ /d "DESKTOP-CF71C55" /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v RegisteredOwner /t REG_SZ /d "DESKTOP-CF71C55" /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v RegisteredOrganization /t REG_SZ /d "Computer" /f

REM --- Chaves Principais do Windows NT ---
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v InstallDate /t REG_DWORD /d 1758222800 /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v BuildGUID /t REG_SZ /d "C05DD730-27CA-8C36-9FE2-BD0188232F84" /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v ProductId /t REG_SZ /d "27620-28840-37395" /f

REM --- Chaves de Criptografia ---
REG ADD "HKLM\SOFTWARE\Microsoft\Cryptography" /v MachineGuid /t REG_SZ /d "70263-37154-98056-39010-88429" /f

REM --- Chaves de System Information e Hardware ---
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\SystemInformation" /v ComputerHardwareId /t REG_SZ /d "{47296-30636-20662-71691-22464}" /f
REG ADD "HKLM\SYSTEM\HardwareConfig" /v LastConfig /t REG_SZ /d "{80354-12457-43045-66796-93610}" /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware Profiles\0001" /v HwProfileGuid /t REG_SZ /d "{47296-30636-20662-71691-22464}" /f

REM --- Chaves de Propriedades de Classe de Dispositivo (Corrigidas) ---
REG ADD "HKLM\SYSTEM\ControlSet001\Control\Class\{4d36e967-e325-11ce-bfc1-08002be10318}\Configuration\Variables\BusDeviceDesc" /v PropertyGuid /t REG_SZ /d "{65245-17704-81791-74731-48719}" /f
REG ADD "HKLM\SYSTEM\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\Configuration\Variables\DeviceDesc" /v PropertyGuid /t REG_SZ /d "{69857-26761-71017-72434-65968}" /f
REG ADD "HKLM\SYSTEM\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\Configuration\Variables\Driver" /v PropertyGuid /t REG_SZ /d "{21719-37313-86259-62859-16215}" /f

REM --- Outras chaves de sistema ---
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Security" /v 671a8285-4edb-4cae-99fe-69a15c48c0bc /t REG_SZ /d "15761-72741-41777-48905-62483" /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /t REG_SZ /d "{64925-10774-97700-55228-40490}" /f
