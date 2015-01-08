#!/bin/bash
# Readline
#------------------------------------------------------------------------------

echo "##------ Building Readline"
PKG="${DIR}/readline-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/readline-*
  ./configure --prefix=${PREFIX}
  make -s
  make install
  clear
else
  echo "There was a problem with Readline"
fi
