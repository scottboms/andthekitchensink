#!/bin/bash
# expat
#------------------------------------------------------------------------------

echo "##------ Building Expat"
PKG="${DIR}/expat-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/expat-*
  ./configure --prefix=${PREFIX}
  make -s
  make install
  clear
else
  echo "There was a problem with Expat"
fi
