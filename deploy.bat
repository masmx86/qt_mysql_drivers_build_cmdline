:: Author:        https://github.com/masmx86
:: Created:       2024-06-01
:: Last Modified: 2024-06-04

:: Tested:        Windows 11 + MSVS2022 + Qt6.7.1

:: Change the <PATH> to your own

@echo off
if "%1"=="" goto ERROR1
if "%2"=="" goto ERROR2

set TMP_DIR=D:\myToolbox\qt_deploy
mkdir %TMP_DIR%
copy %2 %TMP_DIR%\.
D:
cd %TMP_DIR%
dir %TMP_DIR%

call C:\"Program Files"\"Microsoft Visual Studio"\2022\Community\VC\Auxiliary\Build\vcvarsall.bat amd64
D:\Qt\%1\msvc2019_64\bin\windeployqt.exe %2
goto EXIT

:ERROR1
echo Error:     No Qt ver# specified
goto :USAGE

:ERROR2
echo Error:     No <"program name".exe> specified

:USAGE
echo Usage:     deploy.bat "%%1" "%%2"
echo            "%%1":	Qt ver#
echo            "%%2":	"program name".exe

:EXIT
pause
