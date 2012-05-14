#!/bin/bash
# autoconf
#------------------------------------------------------------------------------
echo "##------ Building autoconf"
PKG="${DIR}/autoconf-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/autoconf-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with autoconf"
fi
