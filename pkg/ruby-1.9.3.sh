#!/bin/bash
# Ruby 1.9.3
#------------------------------------------------------------------------------
echo "##------ Building ruby 1.9.3"
PKG="${DIR}/ruby-1.9.3*"
if [ -d ${PKG} ]; then
	cd ${DIR}/ruby-1.9.3*
	./configure --prefix=${PREFIX} --enable-shared --enable-pthread CFLAGS=-D_XOPEN_SOURCE=1
	make
	make install
	make insall-doc
	clear
else
  echo "There was a problem with ruby"
fi
