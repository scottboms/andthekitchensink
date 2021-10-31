#!/bin/bash
# bison
#------------------------------------------------------------------------------
echo "##------ Building bison"
PKG="${DIR}/bison-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/bison-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with bison"
fi
