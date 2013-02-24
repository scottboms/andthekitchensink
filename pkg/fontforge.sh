#!/bin/bash
# FontForge
# http://superb-dca3.dl.sourceforge.net/project/fontforge/fontforge-source/fontforge_full-20120731-b.tar.bz2
#------------------------------------------------------------------------------
echo "##------ Building FontForge"
export CFLAGS="-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk"

PKG="${DIR}/fontforge-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/fontforge-*
  ./configure --prefix=${PREFIX} --enable-double --enable-double --enable-pyextension --with-freetype-src=${PREFIX}/include/freetype2/
  make
  make install
  clear
else
  echo "There was a problem with FontForge"
fi

