#!/bin/bash
# zlib
#------------------------------------------------------------------------------
echo "##------ Building zlib"
PKG="${DIR}/zlib-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/zlib-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with zlib"
fi
