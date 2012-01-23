#!/bin/bash
# MySQL 5.1.61
#------------------------------------------------------------------------------
echo "##------ Building mysql"
PKG="${DIR}/mysql-5*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/mysql-5*
  CC=gcc CFLAGS="-O3 -fno-omit-frame-pointer" CXX=gcc CXXFLAGS="-O3 -fno-omit-frame-pointer -felide-constructors -fno-exceptions -fno-rtti" ./configure --prefix=${PREFIX}/mysql --with-extra-charsets=complex --enable-thread-safe-client --enable-local-infile --enable-shared --with-zlib-dir=bundled --with-big-tables --with-readline --with-plugins=all --without-docs
  make
  make install
  clear
else
  echo "There was a problem with mysql"
fi
