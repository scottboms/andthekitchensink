#!/bin/bash
# Gettext
# ftp://ftp.gnu.org/gettext/gettext-0.18.2.tar.gz
#------------------------------------------------------------------------------
echo "##------ Building gettext"
PKG="${DIR}/gettext-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/gettext-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with gettext"
fi
