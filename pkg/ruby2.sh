#!/bin/bash
# Ruby 2.0
#------------------------------------------------------------------------------
echo "##------ Building ruby 2.0"
PKG="${DIR}/ruby-2*"
if [ -d ${PKG} ]; then
	cd ${DIR}/ruby-2*
	./configure --prefix=${PREFIX} --with-opt-dir=${PREFIX}/openssl --enable-shared --enable-pthread CFLAGS=-D_XOPEN_SOURCE=1
	make
  make test
	make install
	make install-doc
	clear
else
  echo "There was a problem with ruby"
fi
