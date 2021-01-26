#!/bin/bash
# pcre
#------------------------------------------------------------------------------

echo "##------ Building pcre"
PKG="${DIR}/pcre-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/pcre-*
  ./configure --prefix=${PREFIX} CFLAGS='-O2 -Wall'
  make
  make install
  clear
else
  echo "There was a problem with pcre"
fi
