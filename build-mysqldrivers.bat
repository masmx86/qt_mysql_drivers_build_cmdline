REM Author:        https://github.com/masmx86
REM Created:       2024-06-01
REM Last Modified: 2024-06-04

REM Tested:        Windows 11 + MSVS2022 + Qt6.7.1

REM Change the <PATH> to your own
REM mysql header files path:
REM   -DMySQL_INCLUDE_DIR="D:\mysql_qt\include"
REM mysql lib file path:
REM   -DMySQL_LIBRARY="D:\mysql_qt\lib\libmysql.lib"
REM
REM CAUTION: DO NOT SPELL "MySQL_..." AS "MYSQL_..."
REM          Otherwise <PATH> will not be recognised

@echo off
if "%1"=="" goto USAGE

:BUILD
set PATH=%PATH%;D:\Qt\Tools\CMake_64\bin;D:\Qt\Tools\Ninja
D:
cd D:\Qt\%1\Src\qtbase\src\plugins\sqldrivers
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
call D:\Qt\%1\msvc2022_64\bin\qt-cmake.bat -G "Ninja Multi-Config" . -DMySQL_INCLUDE_DIR="D:\mysql_qt\include" -DMySQL_LIBRARY="D:\mysql_qt\lib\libmysql.lib" -DCMAKE_INSTALL_PREFIX="D:\Qt\%1\msvc2022_64" -DCMAKE_CONFIGURATION_TYPES=Release;Debug
ninja
ninja install
goto EXIT

:ERROR
echo No Qt version specified

:USAGE
echo Usage:
echo build-mysqldrivers.bat %1
echo %1:    <Qt ver#>

:EXIT
pause
