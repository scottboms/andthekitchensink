#!/bin/bash
# gmp
#------------------------------------------------------------------------------
echo "##------ Building nettle"
PKG="${DIR}/nettle-3*/"
if [ -d "nettle-3*" ]; then
  cd ${DIR}/nettle-*
  ./.bootstrap
  CFLAGS="-m64" ./configure --prefix=${PREFIX} --disable-assembler
  make
  make install
  clear
else
  echo "There was a problem with nettle"
fi
