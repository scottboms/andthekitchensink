#!/bin/bash
# git
#------------------------------------------------------------------------------
echo "##------ Building git"
PKG="${DIR}/v1.7*/"
if [ -d "git-*" ]; then
  cd ${DIR}/git-*
  make configure
  ./configure --prefix=${PREFIX}
  make all
  make install install-doc install-html
  clear
else
  echo "There was a problem with git"
fi
