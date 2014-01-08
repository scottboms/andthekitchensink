#!/bin/bash
# LibTIFF
#------------------------------------------------------------------------------
echo "##------ Building libtiff"
PKG="${DIR}/tiff-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/tiff-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with libtiff"
fi