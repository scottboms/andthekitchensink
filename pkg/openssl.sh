#!/bin/bash
# autoconf
#------------------------------------------------------------------------------
echo "##------ Building OpenSSL"
PKG="${DIR}/openssl-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/openssl-*
  ./config --prefix=${PREFIX}
  make
  make test
  make install
  clear
else
  echo "There was a problem with OpenSSL"
fi