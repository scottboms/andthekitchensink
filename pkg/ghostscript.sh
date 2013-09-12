#!/bin/bash
# ghostscript 9
#------------------------------------------------------------------------------
echo "##------ Building ghostscript"
PKG="${DIR}/ghostscript-9-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/ghostscript-9*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with ghostscript"
fi