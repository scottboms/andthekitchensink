#!/bin/bash
# autoconf
#------------------------------------------------------------------------------
echo "##------ Building OpenSSL"
PKG="${DIR}/openssl-*/"
VERS="1.0.1h"
SYMLINK="${PREFIX}/openssl"
if [ -d ${PKG} ]; then
  cd ${DIR}/openssl-*
  ./configure darwin64-x86_64-cc --prefix=${PREFIX}/openssl-${VERS}
  make
  make test
  make install
  clear

  if[ -f ${SYMLINK} ]; then
    ln -s ${PREFIX}/openssl-${VERS} ${PREFIX}/openssl
  else
    rm ${PREFIX}/openssl-${VERS}
    ln -s ${PREFIX}/openssl-${VERS} ${PREFIX}/openssl
  fi

else
  echo "There was a problem with OpenSSL"
fi