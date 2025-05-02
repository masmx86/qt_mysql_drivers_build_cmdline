REM Author:        https:\\github.com\masmx86
REM Created:       2024-06-01
REM Last Modified: 2025-04-27

REM Tested:        Windows 11 + MSVS2022 + Qt6.9.0 + MySql Connector/C 8.0.42.0

REM Change the <PATH> to your own Qt installation path accordingly
REM mysql header files path:    -DMySQL_INCLUDE_DIR="D:\Program Files\mysql_qt\include"
REM mysql lib file path:        -DMySQL_LIBRARY="D:\Program Files\mysql_qt\lib\libmysql.lib"

REM CAUTION: DO NOT SPELL "MySQL_..." AS "MYSQL_..." Otherwise <PATH> will not be recognised

REM @echo off
if "%1"=="" goto USAGE

SET QT_VER=%1
SET MSVC_VER=msvc2022_64

:BUILD
set MSVC_BUILD_CMD=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat

set QT_INSTALLATION_DRIVE=D:
set QT_INSTALLATION_PATH=%QT_INSTALLATION_DRIVE%\Qt
set QT_CMAKE_CMD=%QT_INSTALLATION_PATH%\%QT_VER%\%MSVC_VER%\bin\qt-cmake.bat

set PATH=%PATH%;%QT_INSTALLATION_PATH%\Tools\CMake_64\bin;%QT_INSTALLATION_PATH%\Tools\Ninja

set SQL_DRIVER_DIR=D:\Program Files\mysql_qt
set SQL_CONNECTOR_PATH=%SQL_DRIVER_DIR%\mysql-connector-8.0.42.0
set SQL_INCLUDE_PATH=%SQL_CONNECTOR_PATH%\include
set SQL_LIB_FILE=%SQL_CONNECTOR_PATH%\lib\libmysql.lib
set SQL_INSTALL_PREFIX_DIR=%QT_INSTALLATION_PATH%\%QT_VER%\%MSVC_VER%
SET SRC_BUILD_DIR=%QT_INSTALLATION_PATH%\%QT_VER%\Src\qtbase\src\plugins\sqldrivers

set SRC_DRIVER_FILES_DIR=%SQL_INSTALL_PREFIX_DIR%\plugins\sqldrivers
set DEST_DRIVER_FILES_DIR=%SQL_DRIVER_DIR%\%QT_VER%

%QT_INSTALLATION_DRIVE%
cd "%QT_INSTALLATION_PATH%\%QT_VER%\Src\qtbase\src\plugins\sqldrivers"

del "%SRC_BUILD_DIR%\CMakeCache.txt"

call "%MSVC_BUILD_CMD%"

call "%QT_CMAKE_CMD%" -G "Ninja Multi-Config" . -DMySQL_INCLUDE_DIR="%SQL_INCLUDE_PATH%" -DMySQL_LIBRARY="%SQL_LIB_FILE%" -DCMAKE_INSTALL_PREFIX="%SQL_INSTALL_PREFIX_DIR%" -DCMAKE_CONFIGURATION_TYPES=Release;Debug -DQT_GENERATE_SBOM=OFF

ninja
ninja install

copy "%SQL_CONNECTOR_PATH%\lib\*.*" "%SRC_DRIVER_FILES_DIR%\*.*" /y

if exist "%DEST_DRIVER_FILES_DIR%" rmdir "%DEST_DRIVER_FILES_DIR%" /s /q
mkdir "%DEST_DRIVER_FILES_DIR%"
copy "%SRC_DRIVER_FILES_DIR%\*.*" "%DEST_DRIVER_FILES_DIR%\*.*" /y
goto EXIT

:ERROR
echo No Qt version specified

:USAGE
echo Usage:
echo build-mysqldrivers.bat %1
echo %1:    <Qt ver#>

:EXIT
pause
