#!/bin/bash
# php8
#------------------------------------------------------------------------------

export LDFLAGS=-L/usr/local/openssl/lib
export CPPFLAGS=-I/usr/local/openssl/include
export PKG_CONFIG_PATH="/usr/local/openssl/lib/pkgconfig"

# Requires: Onig, OpenSSL, Iconv, Curl, Bison, AutoConf, AutoMake, Bzip, Zlib, ImageMagick, Sqlite3

echo "##------ Building php8"
PKG="${DIR}/php-8*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/php-8*
  ./configure --prefix=${PREFIX} --with-config-file-path=/usr/local/lib --enable-bcmath --enable-cli --enable-exif --enable-mbstring --enable-gd --enable-gd-jis-conv --enable-sockets --enable-opcache --enable-simplexml --with-sqlite3 --enable-xmlreader --enable-xmlwriter --with-pdo-sqlite --with-bz2 --with-curl --with-pear --with-xsl --with-zlib --with-iconv --with-openssl  OPENSSL_CFLAGS=-I${PREFIX}/openssl/include OPENSSL_LIBS="-L${PREFIX}/openssl/lib -lssl -lcrypto"
  make
  make install
  clear
else
  echo "There was a problem with php8"
fi
