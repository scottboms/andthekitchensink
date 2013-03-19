#!/bin/bash
# ImageMagick
#------------------------------------------------------------------------------
echo "##------ Building ImageMagick"
PKG="${PKG}/ImageMagick-*/"
if [ -d "ImageMagick-*" ]; then
  cd ${DIR}/ImageMagick-*
  make configure
  ./configure --prefix=${PREFIX} --with-quantum-depth=16 --disable-dependency-tracking --with-x=yes --x-includes=/usr/X11R6/include --x-libraries=/usr/X11R6/lib --without-perl --without-wmf
  make all
  make install
  clear
else
  echo "There was a problem with ImageMagick"
fi
