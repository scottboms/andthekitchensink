#!/bin/bash
# mercurial
#------------------------------------------------------------------------------
echo "##------ Building mercurial"
PKG="${DIR}/mercurial-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/mercurial-*
  python setup.py install --force --home=${PREFIX}
  clear
else
  echo "There was a problem with mercurial"
fi
