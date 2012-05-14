#!/bin/bash
# libtool
#------------------------------------------------------------------------------
echo "##------ Building libtool"
PKG="${DIR}/libtool-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/libtool-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with libtool"
fi
