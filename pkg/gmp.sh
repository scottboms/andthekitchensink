#!/bin/bash
# gmp
#------------------------------------------------------------------------------
echo "##------ Building gmp"
PKG="${DIR}/gmp-6*/"
if [ -d "gmp-*" ]; then
  cd ${DIR}/gmp-*
  CC=gcc-4.2 CXX=g++4.2 ./configure --prefix=${PREFIX}
  make check
  make 
  make install
  clear
else
  echo "There was a problem with gmp"
fi
