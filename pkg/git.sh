#!/bin/bash
# git
#------------------------------------------------------------------------------
echo "##------ Building git"
PKG="${DIR}/git-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/git-*
  ./configure --prefix=${PREFIX}
  make all
  make install install-doc install-html
  clear
else
  echo "There was a problem with git"
fi
