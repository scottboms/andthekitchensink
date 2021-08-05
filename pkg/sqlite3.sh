#!/bin/bash
# sqlite3
#------------------------------------------------------------------------------
echo "##------ Building sqlite3"
PKG="${DIR}/sqlite-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/sqlite-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with sqlite3"
fi
