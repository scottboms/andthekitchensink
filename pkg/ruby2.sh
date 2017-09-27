#!/bin/bash
# Ruby 2.4.2
#------------------------------------------------------------------------------
echo "##------ Building ruby 2.4"
PKG="${DIR}/ruby-2*"
if [ -d ${PKG} ]; then
	cd ${DIR}/ruby-2*
	./configure --prefix=${PREFIX} --with-opt-dir=${PREFIX}/openssl --enable-shared --with-readline-dir=${PREFIX} CFLAGS=-D_XOPEN_SOURCE=1
	make
	make test
	make install
	make install-doc
	clear
else
  echo "There was a problem with ruby"
fi
