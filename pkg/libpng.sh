#!/bin/bash
# libpng
#------------------------------------------------------------------------------
echo "##------ Building libpng"
PKG="${DIR}/libpng-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/libpng-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with libpng"
fi