#!/bin/bash
# ImageMagick
#------------------------------------------------------------------------------
echo "##------ Building ImageMagick"
PKG="${PKG}/ImageMagick-*/"
if [ -d "ImageMagick-*" ]; then
  cd ${DIR}/ImageMagick-*
  make configure
  ./configure --prefix=${PREFIX} --with-quantum-depth=16 --disable-dependency-tracking --with-x=yes --x-includes=/opt/X11/include --x-libraries=/opt/X11/lib --without-perl --without-wmf
  make all
  ldconfig /usr/local/lib
  make check
  make install
  clear
else
  echo "There was a problem with ImageMagick"
fi
