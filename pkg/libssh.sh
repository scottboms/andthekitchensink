#!/bin/bash
# libssh
#------------------------------------------------------------------------------
echo "##------ Building LibSSH"
PKG="${DIR}/2*/"
if [ -d "libssh-*" ]; then
	cd ${DIR}/libssh-*
	./configure --prefix=${PREFIX} --with-libssl-prefix=${PREFIX}/openssl
	make -j 8
	make install
	clear
else
	echo "There was a problem with LibSSH"
fi