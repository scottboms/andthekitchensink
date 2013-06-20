#!/bin/bash
# freetype
#------------------------------------------------------------------------------

echo "##------ Building freetype"
PKG="${DIR}/freetype-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/freetype-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with freetype"
fi