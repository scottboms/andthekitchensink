#!/bin/bash
# re2c
#------------------------------------------------------------------------------
echo "##------ Building re2c"
PKG="${DIR}/re2c-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/re2c-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with re2c"
fi
