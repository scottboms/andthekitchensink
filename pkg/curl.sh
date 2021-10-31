#!/bin/bash
# curl
#------------------------------------------------------------------------------
echo "##------ Building curl"
PKG="${DIR}/curl-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/curl-*
  ./configure --prefix=${PREFIX} --with-openssl=/usr/local/openssl
  make -j8
  make install
  clear
else
  echo "There was a problem with curl"
fi
