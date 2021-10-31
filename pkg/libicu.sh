#!/bin/bash
# libicu
#------------------------------------------------------------------------------
echo "##------ Building libicu"
PKG="${DIR}/icu-*"
if [ -d ${PKG} ]; then
  cd ${DIR}/icu/source
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with libicu"
fi