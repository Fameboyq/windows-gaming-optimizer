@echo off
title Cache & Temp Cleaner by Fameboyq
echo [*] Cleaning Windows Temporary and Junk Files...

:: User Temp
del /s /f /q "%temp%\*.*" >nul 2>&1
for /d %%x in ("%temp%\*") do @rd /s /q "%%x" >nul 2>&1

:: Windows Temp
del /s /f /q "C:\Windows\Temp\*.*" >nul 2>&1
for /d %%x in ("C:\Windows\Temp\*") do @rd /s /q "%%x" >nul 2>&1

:: Prefetch
del /s /f /q "C:\Windows\Prefetch\*.*" >nul 2>&1

:: DirectX Shader Cache
del /s /f /q "%localappdata%\D3DSCache\*.*" >nul 2>&1
del /s /f /q "%localappdata%\NVIDIA\DXCache\*.*" >nul 2>&1
del /s /f /q "%localappdata%\AMD\DxCache\*.*" >nul 2>&1

:: Delivery Optimization Cache
del /s /f /q "C:\Windows\SoftwareDistribution\Download\*.*" >nul 2>&1

:: DNS Flush
ipconfig /flushdns >nul 2>&1

echo [+] Junk and temporary cache cleaning complete.
