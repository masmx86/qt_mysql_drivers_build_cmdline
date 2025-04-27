REM Author:        https://github.com/masmx86
REM Created:       2024-06-01
REM Last Modified: 2025-04-27

REM Tested:        Windows 11 + MSVS2022 + Qt6.9.0

REM Change the <PATH> to your own Qt installation path accordingly
REM mysql header files path:    -DMySQL_INCLUDE_DIR="D:\Program Files\mysql_qt\include"
REM mysql lib file path:        -DMySQL_LIBRARY="D:\Program Files\mysql_qt\lib\libmysql.lib"

REM CAUTION: DO NOT SPELL "MySQL_..." AS "MYSQL_..." Otherwise <PATH> will not be recognised

@echo off
if "%1"=="" goto USAGE

:BUILD
set MSVC_BUILD_CMD=C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvars64.bat

set QT_INSTALLATION_DRIVE=D:
set QT_INSTALLATION_PATH=%QT_INSTALLATION_DRIVE%/Qt
set QT_CMAKE_CMD=%QT_INSTALLATION_PATH%/%1/msvc2022_64/bin/qt-cmake.bat

set PATH=%PATH%;%QT_INSTALLATION_PATH%/Tools/CMake_64\bin;%QT_INSTALLATION_PATH%/Tools/Ninja

set SQL_HEADER_PATH=D:/Program Files/mysql_qt
set SQL_INCLUDE_PATH=%SQL_HEADER_PATH%/include
set SQL_LIB_FILE=%SQL_HEADER_PATH%/lib/libmysql.lib
set SQL_INSTALL_PREFIX_DIR=%QT_INSTALLATION_PATH%/%1/msvc2022_64

set SRC_DRIVER_FILES_DIR=%SQL_INSTALL_PREFIX_DIR%/plugins/sqldrivers
set DEST_DRIVER_FILES_DIR=%SQL_HEADER_PATH%/%1

%QT_INSTALLATION_DRIVE%
cd %QT_INSTALLATION_PATH%/%1/Src/qtbase/src/plugins/sqldrivers

call "%MSVC_BUILD_CMD%"

call "%QT_CMAKE_CMD%" -G "Ninja Multi-Config" . -DMySQL_INCLUDE_DIR="%SQL_INCLUDE_PATH%" -DMySQL_LIBRARY="%SQL_LIB_FILE%" -DCMAKE_INSTALL_PREFIX="%SQL_INSTALL_PREFIX_DIR%" -DCMAKE_CONFIGURATION_TYPES=Release;Debug -DQT_GENERATE_SBOM=OFF

ninja
ninja install

REM mkdir "%DEST_DRIVER_FILES_FOLDER%"
REM COPYING SQL DRIVER FILES TO DESTINATION FOLDER...
xcopy "%SRC_DRIVER_FILES_DIR%" "%DEST_DRIVER_FILES_DIR%" /i /s /y
goto EXIT

:ERROR
echo No Qt version specified

:USAGE
echo Usage:
echo build-mysqldrivers.bat %1
echo %1:    <Qt ver#>

:EXIT
pause
