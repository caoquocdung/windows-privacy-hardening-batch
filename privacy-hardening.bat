@echo off
:: --- Auto-elevate to Administrator ---
NET SESSION >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

REM --- Disable Bing Search in Windows Search ---
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f

REM --- Disable Web Search from Start Menu (Win10/11) ---
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchUseWeb /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchUseWebOverMeteredConnections /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCloudSearch /t REG_DWORD /d 0 /f

REM --- Disable Telemetry (AllowTelemetry=0) ---
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

REM --- Disable Windows Error Reporting ---
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f

echo.
echo [!] Policies set. Verifying registry values...
echo.

:: --- Verify Telemetry ---
REG QUERY "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry
if %ERRORLEVEL%==0 (
    echo [Telemetry] AllowTelemetry key found.
) else (
    echo [Telemetry] AllowTelemetry key NOT found!
)

:: --- Verify Error Reporting ---
REG QUERY "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled
if %ERRORLEVEL%==0 (
    echo [Error Reporting] Disabled key found.
) else (
    echo [Error Reporting] Disabled key NOT found!
)

echo.
echo [*] Review the above output for value (0 = telemetry disabled, 1 = error reporting disabled).
echo [*] You may need to restart your computer for all changes to take effect.
pause
