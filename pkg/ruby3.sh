#!/bin/bash
# Ruby 3
#------------------------------------------------------------------------------
echo "##------ Building ruby 3"
PKG="${DIR}/ruby-3*"
if [ -d ${PKG} ]; then
	cd ${DIR}/ruby-3*
	./configure --prefix=${PREFIX} --with-opt-dir=${PREFIX}/openssl --enable-shared --with-readline-dir=${PREFIX} CFLAGS=-D_XOPEN_SOURCE=1
	make
	make test
	make install
	make install-doc
	clear
else
  echo "There was a problem with ruby 3"
fi
