#!/bin/bash
# gmp
#------------------------------------------------------------------------------
echo "##------ Building gnutls"
PKG="${DIR}/gnutls-3*/"
if [ -d "gnutls-*" ]; then
  cd ${DIR}/gmp-*
  CFLAGS="-m64" CXXFLAGS="-m64" ./configure --prefix=${PREFIX} --without-p11-kit --with-included-libtasn1 --with-included-unistring
  make
  make install
  clear
else
  echo "There was a problem with gnutls"
fi
