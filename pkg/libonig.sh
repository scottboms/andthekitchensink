#!/bin/bash
# libonig
#------------------------------------------------------------------------------
echo "##------ Building libonig"
PKG="${DIR}/onig-*"
if [ -d ${PKG} ]; then
  cd ${DIR}/onig-*
  autoreconf -vfi
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with libonig"
fi