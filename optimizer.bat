@echo off
setlocal EnableDelayedExpansion
title Windows Gaming Optimizer by Fameboyq
chcp 65001 >nul

:: Check Administrator Privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] Running without administrator privileges. Requesting elevation...
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

:MENU
cls
echo =====================================================================
echo           WINDOWS GAMING OPTIMIZER & LATENCY DEBLOATER
echo                       Developed by Fameboyq
echo =====================================================================
echo.
echo  [1] FULL OPTIMIZATION (Apply all tweaks + Ultimate Performance)
echo  [2] Apply Registry Gaming Tweaks (tweaks.reg)
echo  [3] Enable Ultimate Performance Power Plan
echo  [4] Disable GameDVR, Xbox Bar and Background Recording
echo  [5] Fix Mouse Input (Disable Enhanced Pointer Precision, 1:1 Input)
echo  [6] Apply Network & TCP Low-Latency Tweaks
echo  [7] Clean Temporary Files, Cache & Shader Caches
echo  [8] Create System Restore Point (Recommended before tweaks)
echo  [9] Exit
echo.
echo =====================================================================
set /p opt="Select an option [1-9]: "

if "%opt%"=="1" goto FULL_OPT
if "%opt%"=="2" goto REG_TWEAKS
if "%opt%"=="3" goto ULTIMATE_PLAN
if "%opt%"=="4" goto GAMEDVR
if "%opt%"=="5" goto MOUSE_INPUT
if "%opt%"=="6" goto TCP_TWEAKS
if "%opt%"=="7" goto CLEAN_CACHE
if "%opt%"=="8" goto RESTORE_POINT
if "%opt%"=="9" exit /b
goto MENU

:RESTORE_POINT
echo.
echo [*] Creating System Restore Point "GamingOptimizer_Backup"...
powershell -Command "Checkpoint-Computer -Description 'GamingOptimizer_Backup' -RestorePointType 'MODIFY_SETTINGS'" 2>nul
if %errorLevel% equ 0 (
    echo [+] Restore point successfully created.
) else (
    echo [!] System Restore may be disabled on this system. Continuing...
)
pause
goto MENU

:REG_TWEAKS
echo.
echo [*] Applying Registry Gaming Tweaks from scripts\tweaks.reg...
if exist "%~dp0scripts\tweaks.reg" (
    regedit /s "%~dp0scripts\tweaks.reg"
    echo [+] Registry tweaks applied.
) else (
    echo [-] Error: scripts\tweaks.reg not found!
)
pause
goto MENU

:ULTIMATE_PLAN
echo.
echo [*] Enabling Ultimate Performance Power Plan...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
for /f "tokens=4" %%i in ('powercfg -list ^| findstr /i "Ultimate Performance"') do set "SCHEME_GUID=%%i"
if defined SCHEME_GUID (
    powercfg -setactive %SCHEME_GUID%
    echo [+] Ultimate Performance plan activated (%SCHEME_GUID%).
) else (
    powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
    echo [+] High Performance plan activated (Ultimate not supported on this OS build).
)
pause
goto MENU

:GAMEDVR
echo.
echo [*] Disabling GameDVR and Xbox Gaming Services...
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
echo [+] GameDVR and Xbox background capture disabled.
pause
goto MENU

:MOUSE_INPUT
echo.
echo [*] Applying 1:1 Raw Mouse Input and disabling pointer acceleration...
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f >nul 2>&1
echo [+] Mouse acceleration disabled (1:1 Raw Pointer Response set).
pause
goto MENU

:TCP_TWEAKS
echo.
echo [*] Applying TCP / Network Low Latency Tweaks...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global chimney=disabled >nul 2>&1
netsh int tcp set global ecncapability=disabled >nul 2>&1
netsh int tcp set global timestamps=disabled >nul 2>&1
netsh int tcp set heuristics disabled >nul 2>&1
echo [+] TCP Stack and low-latency network parameters configured.
pause
goto MENU

:CLEAN_CACHE
echo.
echo [*] Running Temporary Files & Shader Cache Cleaner...
if exist "%~dp0scripts\clean_temp.bat" (
    call "%~dp0scripts\clean_temp.bat"
) else (
    echo [-] Error: scripts\clean_temp.bat not found!
)
pause
goto MENU

:FULL_OPT
echo.
echo =====================================================================
echo              STARTING FULL GAMING OPTIMIZATION
echo =====================================================================
echo.
echo [1/6] Applying Registry Tweaks...
if exist "%~dp0scripts\tweaks.reg" regedit /s "%~dp0scripts\tweaks.reg"

echo [2/6] Activating Ultimate Performance Power Plan...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
for /f "tokens=4" %%i in ('powercfg -list ^| findstr /i "Ultimate Performance"') do set "SCHEME_GUID=%%i"
if defined SCHEME_GUID (
    powercfg -setactive %SCHEME_GUID%
) else (
    powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
)

echo [3/6] Disabling GameDVR and Xbox Game Bar...
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f >nul 2>&1

echo [4/6] Setting 1:1 Raw Mouse Input...
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f >nul 2>&1

echo [5/6] Tuning Network and TCP Latency...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global chimney=disabled >nul 2>&1
netsh int tcp set global ecncapability=disabled >nul 2>&1
netsh int tcp set global timestamps=disabled >nul 2>&1
netsh int tcp set heuristics disabled >nul 2>&1

echo [6/6] Cleaning Junk Caches...
if exist "%~dp0scripts\clean_temp.bat" call "%~dp0scripts\clean_temp.bat"

echo.
echo =====================================================================
echo [+] FULL GAMING OPTIMIZATION COMPLETED SUCCESSFULLY!
echo [*] A system restart is recommended for all tweaks to take effect.
echo =====================================================================
echo.
pause
goto MENU
