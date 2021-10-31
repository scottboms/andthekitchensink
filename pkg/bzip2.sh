#!/bin/bash
# bzip2
#------------------------------------------------------------------------------
echo "##------ Building bzip2"
PKG="${DIR}/bzip2-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/bzip2-*
  make -j8
  make install
  clear
else
  echo "There was a problem with bzip2"
fi
