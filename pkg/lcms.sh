#!/bin/bash
# Little CMS
#------------------------------------------------------------------------------
echo "##------ Building lcms"
PKG="${DIR}/lcms2-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/lcms2-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with lcms"
fi