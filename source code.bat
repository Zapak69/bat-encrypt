��&cls
::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFCFdXBS+GG6pDaET+NTV4PwkYw0OWO2apoTa5reBLvYW+FGqcI4otg==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
%HOMEDRIVE%
@echo off
setlocal enabledelayedexpansion

:: Zadejte cestu k souboru
set target_file=%1

:: Kontrola, zda je soubor zadaný
if "%target_file%"=="" (
    call :file
)

:: Vytvoření dočasného souboru s hexadecimálními daty
echo FF FE 26 63 6C 73 0D 0A > header.hex

:: Konvertování hexadecimálního souboru na binární pomocí certutil
certutil -f -decodehex header.hex header.bin >nul

:: Spojení binárních dat s cílovým souborem
copy /b header.bin + %target_file% encoded_%target_file% >nul

:: Vyčištění dočasných souborů
del header.hex >nul
del header.bin >nul

echo.
echo.
echo Operation done. Encoded file: 
echo [42m[97m%~dp0\encoded_%target_file%[0m
pause >nul
exit

:file
cls
call :banner
echo    Enter traget file path!
set /p "target_file=[0m   > "
if NOT exist "%target_file%" exit
exit /b 0

:banner
echo.
echo.
echo  [38;5;46m________  ________  _________        _______   ________   ________  ________      ___    ___ ________  _________   
echo [38;5;47m^|\   __  \^|\   __  \^|\___   ___\     ^|\  ___ \ ^|\   ___  \^|\   ____\^|\   __  \    ^|\  \  /  /^|\   __  \^|\___   ___\ 
echo [38;5;48m\ \  \^|\ /\ \  \^|\  \^|___ \  \_^|     \ \   __/^|\ \  \\ \  \ \  \___^|\ \  \^|\  \   \ \  \/  / ^| \  \^|\  \^|___ \  \_^| 
echo  [38;5;49m\ \   __  \ \   __  \   \ \  \       \ \  \_^|/_\ \  \\ \  \ \  \    \ \   _  _\   \ \    / / \ \   ____\   \ \  \  
echo   [38;5;50m\ \  \^|\  \ \  \ \  \   \ \  \       \ \  \_^|\ \ \  \\ \  \ \  \____\ \  \\  \^|   \/  /  /   \ \  \___^|    \ \  \ 
echo    [38;5;51m\ \_______\ \__\ \__\   \ \__\       \ \_______\ \__\\ \__\ \_______\ \__\\ _\ __/  / /      \ \__\        \ \__\
echo     [38;5;45m\^|_______^|\^|__^|\^|__^|    \^|__^|        \^|_______^|\^|__^| \^|__^|\^|_______^|\^|__^|\^|__^|\___/ /        \^|__^|         \^|__^|
echo                                                                                  [38;5;39m\^|___^|/                            
echo                                               github.com/Zapak69
echo                                      This script can encrypt your batch file[0m