#!/bin/bash
# Unicode Names List
# http://iweb.dl.sourceforge.net/project/libuninameslist/libuninameslist%20sources/Unicode_5.2-20091231/libuninameslist-20091231.tar.bz2
#------------------------------------------------------------------------------
echo "##------ Building Unicode Names List"
PKG="${DIR}/libuninameslist*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/fontforge-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with Unicode Names List"
fi

