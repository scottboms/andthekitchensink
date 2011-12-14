#!/bin/bash
# YAML 0.1.4 C Library
# http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
#------------------------------------------------------------------------------
echo "##------ Building YAML C library"
PKG="${DIR}/yaml-*"
if [ -d ${PKG} ]; then
	cd ${DIR}/yaml-*
	./configure --prefix=${PREFIX}
	make
	make install
	clear
else
  echo "There was a problem with YAML"
fi
