#!/bin/bash
# automake
#------------------------------------------------------------------------------
echo "##------ Building automake"
PKG="${DIR}/automake-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/automake-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with automake"
fi
