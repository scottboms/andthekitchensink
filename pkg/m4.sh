#!/bin/bash
# m4
#------------------------------------------------------------------------------
echo "##------ Building m4"
PKG="${DIR}/m4-1*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/m4-1*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with m4"
fi
