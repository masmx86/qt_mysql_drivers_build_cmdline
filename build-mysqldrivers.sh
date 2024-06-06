#!/bin/bash

# https://github.com/masmx86
# Created:       2024-06-01
# Last Modified: 2024-06-04

# Tested:        Manjaro 6.9.2

# packages required: 
# libmysqlclient
# ninja

# specify qt version as the 1st parameter
if [ -z "$1" ]
then
  echo "No Qt version selected"
else
  echo "Building for Qt version $1 ..."

  # this section from:
  # https://doc.qt.io/qt-6/sql-driver.html#building-the-drivers
  QT_DIR="/opt/Qt/$1"
  SQL_SRC_DIR="Src/qtbase/src/plugins/sqldrivers"
  CUR_PWD=$PWD
  TMP_BUILD_DIR="build-sqldrivers"

  cd
  mkdir $TMP_BUILD_DIR
  cd $TMP_BUILD_DIR
  # qt-cmake -G Ninja <qt_source_directory>/qtbase/src/plugins/sqldrivers -DCMAKE_INSTALL_PREFIX=<qt_installation_path>/<platform> -DMySQL_INCLUDE_DIR="/usr/local/mysql/include" -DMySQL_LIBRARY="/usr/local/mysql/lib/libmysqlclient.<so|dylib>"
  $QT_DIR/gcc_64/bin/qt-cmake -G Ninja $QT_DIR/$SQL_SRC_DIR -DCMAKE_INSTALL_PREFIX=$QT_DIR/gcc_64 -DMySQL_INCLUDE_DIR="/usr/include/mysql" -DMySQL_LIBRARY="/usr/lib/libmysqlclient.so"
  cmake --build .
  cmake --install .

  cd
  echo "-- Cleaning up..."
  rm -r $TMP_BUILD_DIR
  echo "-- Done"
  
  cd $CUR_PWD
fi
