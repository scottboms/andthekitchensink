#!/bin/bash
# LibTIFF
#------------------------------------------------------------------------------
echo "##------ Building msmtp"
PKG="${DIR}/msmtp-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/msmtp-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with msmtp"
fi