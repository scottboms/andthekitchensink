#!/bin/bash
# Pound
#------------------------------------------------------------------------------

echo "##------ Building Pound"
PKG="${DIR}/Pound-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/Pound-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with Pound"
fi
