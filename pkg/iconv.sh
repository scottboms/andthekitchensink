#!/bin/bash
# iconv
#------------------------------------------------------------------------------
echo "##------ Building iconv"
PKG="${DIR}/iconv-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/iconv-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with iconv"
fi
