@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process -FilePath '%~f0' -Verb runAs"
    exit /b
)

title Temp Deleter
color 2

:menu
cls
echo ============================
echo       Temp Cleaner
echo ============================
echo.
echo 1. Delete Windows Temp Folder (C:\Windows\Temp)
echo 2. Delete User Temp Folder (%TEMP%)
echo 3. Delete Both Temp Folders
echo 4. Delete Prefetch
echo 5. Delete Recent Files
echo 6. About
echo 7. Exit
echo.
set /p choice=Select an option (1-7): 

if "%choice%"=="1" goto winTemp
if "%choice%"=="2" goto userTemp
if "%choice%"=="3" goto both
if "%choice%"=="4" goto prefetch
if "%choice%"=="5" goto recent
if "%choice%"=="6" goto about
if "%choice%"=="7" exit
goto menu

:winTemp
cls
echo ============================
echo  Clean Windows Temp Folder
echo ============================
echo.
echo Deleting files from C:\Windows\Temp ...
del /f /s /q "C:\Windows\Temp\*.*"
for /d %%i in ("C:\Windows\Temp\*") do rd /s /q "%%i"
echo Done.
echo.
pause
goto menu

:userTemp
cls
echo ============================
echo    Clean User Temp Folder
echo ============================
echo.
echo Deleting files from %TEMP% ...
del /f /s /q "%TEMP%\*.*"
for /d %%i in ("%TEMP%\*") do rd /s /q "%%i"
echo Done.
echo.
pause
goto menu

:both
cls
echo ============================
echo   Clean Both Temp Folders
echo ============================
echo.
echo Deleting files from C:\Windows\Temp ...
del /f /s /q "C:\Windows\Temp\*.*"
for /d %%i in ("C:\Windows\Temp\*") do rd /s /q "%%i"
echo Done.
echo.
echo Deleting files from %TEMP% ...
del /f /s /q "%TEMP%\*.*"
for /d %%i in ("%TEMP%\*") do rd /s /q "%%i"
echo Done.
pause
goto menu

:prefetch
cls
echo ============================
echo       Delete Prefetch
echo ============================
echo.
echo Deleting Prefetch files...
del /f /s /q "C:\Windows\Prefetch\*.*"
for /d %%i in ("C:\Windows\Prefetch\*") do rd /s /q "%%i"
echo Done.
echo.
pause
goto menu

:recent
cls
echo ============================
echo     Delete Recent Files
echo ============================
echo.
echo Deleting Recent Files...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*.*"
for /d %%i in ("%APPDATA%\Microsoft\Windows\Recent\*") do rd /s /q "%%i"
echo Done.
echo.
pause
goto menu

:about
cls
echo ============================
echo            ABOUT
echo ============================
echo.
echo Program: Temp Cleaner
echo Version: 1.0
echo Made by: Arkia
echo.
echo A simple tool to clean:
echo - Windows Temp
echo - User Temp
echo - Prefetch
echo - Recent Files
echo.
pause
goto menu
