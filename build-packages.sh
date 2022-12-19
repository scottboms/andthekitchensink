#!/bin/bash
# Compile the downloaded packages one at a time
# DEBUG: echo $(env)

#------------------------------------------------------------------------------

PKG=""

echo "##------ Building m4 1.4.19"
PKG="${DIR}/m4-1*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/m4-1*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with m4"
fi

#------------------------------------------------------------------------------

echo "##------ Building autoconf 2.71"
PKG="${DIR}/autoconf-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/autoconf-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with autoconf"
fi

#------------------------------------------------------------------------------

echo "##------ Building automake 1.16.5"
PKG="${DIR}/automake-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/automake-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with automake"
fi

#------------------------------------------------------------------------------

echo "##------ Building libtool 2.4.6"
PKG="${DIR}/libtool-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/libtool-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with libtool"
fi

#------------------------------------------------------------------------------

echo "##------ Building pkg-config 0.29.2"
PKG="${DIR}/pkg-config-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/pkg-config-*
  ./configure --prefix=${PREFIX} --with-internal-glib
  make -j8
  make install
  clear
else
  echo "There was a problem with pkg-config"
fi

#------------------------------------------------------------------------------

echo "##------ Building zLib 1.2.13"
PKG="${DIR}/zlib-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/zlib-*
  ./configure --prefix=${PREFIX}
  make -s
  make install
  clear
else
  echo "There was a problem with zLib"
fi

#------------------------------------------------------------------------------

echo "##------ Building PCRE2 10.42"
PKG="${DIR}/pcre2-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/pcre-*
  ./configure --prefix=${PREFIX} CFLAGS='-O2 -Wall'
  make -s
  make install
  clear
else
  echo "There was a problem with PCRE2"
fi

#------------------------------------------------------------------------------

echo "##------ Building re2c 3.0 (was 2.2)"
PKG="${DIR}/re2c-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/re2c-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with re2c"
fi

#------------------------------------------------------------------------------

echo "##------ Building YAML C library 0.2.5"
PKG="${DIR}/yaml-*"
if [ -d ${PKG} ]; then
	cd ${DIR}/yaml-*
	./configure --prefix=${PREFIX}
	make -j8
	make install
	clear
else
  echo "There was a problem with YAML"
fi

#------------------------------------------------------------------------------

echo "##------ Building Readline 8.1"
PKG="${DIR}/readline-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/readline-*
  ./configure --prefix=${PREFIX}
  make -s
  make install
  clear
else
  echo "There was a problem with Readline"
fi

#------------------------------------------------------------------------------

echo "##------ Building gettext 0.21"
PKG="${DIR}/gettext-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/gettext-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with gettext"
fi

#------------------------------------------------------------------------------

# Requires GetText
echo "##------ Building libonig 6.9.8"
PKG="${DIR}/onig-*"
if [ -d ${PKG} ]; then
  cd ${DIR}/onig-*
  autoreconf -vfi
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with libonig"
fi

#------------------------------------------------------------------------------

echo "##------ Building iconv 1.17"
PKG="${DIR}/iconv-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/iconv-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with iconv"
fi

#------------------------------------------------------------------------------

echo "##------ Building Expat 2.5.0"
PKG="${DIR}/expat-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/expat-*
  ./configure --prefix=${PREFIX}
  make -s
  make install
  clear
else
  echo "There was a problem with Expat"
fi

#------------------------------------------------------------------------------

echo "##------ Building bzip2 1.0.8"
# Required for PHP
PKG="${DIR}/bzip2-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/bzip2-*
  make -j8
  make install PREFIX=${PREFIX}
  clear
else
  echo "There was a problem with bzip2"
fi

#------------------------------------------------------------------------------

echo "##------ Building bison 3.8.2"
# Required for PHP
PKG="${DIR}/bison-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/bison-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with bison"
fi

#------------------------------------------------------------------------------

echo "##------ Building gmp 6.2.1"
PKG="${DIR}/gmp-6*/"
if [ -d "gmp-*" ]; then
  cd ${DIR}/gmp-*
  # CC=gcc-4.2 CXX=g++4.2 ./configure --prefix=${PREFIX}
  ./configure --prefix=${PREFIX}
  make check
  make  -j8
  make install
  clear
else
  echo "There was a problem with gmp"
fi

#------------------------------------------------------------------------------

## First patch files manually as necessary and noted
## Also change Darwin type below -- darwin64-x86_64-cc | darwin64-arm64-cc

echo "##------ Building OpenSSL 1.1.1s"
PKG="${DIR}/openssl-*/"
VERS="1.1.1q"
SYMLINK="${PREFIX}/openssl"
if [ -d ${PKG} ]; then
  cd ${DIR}/openssl-*
  make configure
  ./configure --prefix=${PREFIX}/openssl-${VERS} shared enable-rc5 zlib darwin64-x86_64-cc no-asm
  make -j8
  # make test
  make install

  if[ -f ${SYMLINK} ]; then
    ln -s ${PREFIX}/openssl-${VERS} ${PREFIX}/openssl
  else
    rm ${PREFIX}/openssl-${VERS}
    ln -s ${PREFIX}/openssl-${VERS} ${PREFIX}/openssl
  fi

  clear
else
  echo "There was a problem with OpenSSL"
fi

#------------------------------------------------------------------------------

echo "##------ Building curl 7.86.0"
# Requires OpenSSL
export PKG_CONFIG_PATH=${PREFIX}/openssl/lib/pkgconfig

PKG="${DIR}/curl-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/curl-*
  ./configure --prefix=${PREFIX} --with-openssl
  make -j8
  make install
  clear
else
  echo "There was a problem with curl"
fi

#------------------------------------------------------------------------------

echo "##------ Building LibXML2 2.9.14"
PKG="${DIR}/libxml2-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/libxml2-*
  ./autogen.sh --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with LibXML2"
fi

#------------------------------------------------------------------------------

echo "##------ Building LibXSLT 1.1.35"
PKG="${DIR}/libxslt-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/libxslt-*
  ./autogen.sh --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with LibXML2"
fi

#------------------------------------------------------------------------------

echo "##------ Building git 2.39"

## MAYBE HAS PROBLEM WITH LIBICONV...
PKG="${DIR}/git-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/git-*
  make configure
  ./configure --prefix=${PREFIX} --with-openssl=${PREFIX}/openssl --with-iconv=${PREFIX}
  make all -j8
  make install install-doc install-html
  clear
else
  echo "There was a problem with git"
fi

#------------------------------------------------------------------------------

echo "##------ Building FreeType 2.12.1"
PKG="${DIR}/freetype-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/freetype-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with FreeType"
fi

#------------------------------------------------------------------------------

echo "##------ Building libjpeg 0.9e"
PKG="${DIR}/jpeg-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/jpeg-*
  # ln -s /Developer/usr/bin/glibtool libtool
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with libjpeg"
fi

#------------------------------------------------------------------------------

echo "##------ Building libtiff 4.4.0"
PKG="${DIR}/tiff-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/tiff-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with libtiff"
fi

#------------------------------------------------------------------------------

echo "##------ Building libpng 1.6.39"
PKG="${DIR}/libpng-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/libpng-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with libpng"
fi

#------------------------------------------------------------------------------

echo "##------ Building libwebp 1.24"
PKG="${DIR}/libwebp/"
if [ -d ${PKG} ]; then
  cd ${DIR}/libwebp
  ./autogen.sh
  ./configure --prefix=${PREFIX} --with-pnglibdir=${PREFIX}/lib --with-pngincludedir=${PREFIX}/include --with-jpeglibdir=${PREFIX}/lib --with-jpegincludedir=${PREFIX}/include --with-tifflibdir=${PREFIX}/lib --with-tiffincludedir=${PREFIX}/include --disable-gif
  make -j8
  make install
  clear
else
  echo "There was a problem with libpng"
fi

#------------------------------------------------------------------------------

echo "##------ Building lcms 2.14"
PKG="${DIR}/lcms2-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/lcms2-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with lcms"
fi

#------------------------------------------------------------------------------

echo "##------ Building Ghostscript 10.0.0"
# TODO: Look at fixing jpeg, webp, and png support, etc.
PKG="${DIR}/ghostscript-10*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/ghostscript-10*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with Ghostscript"
fi

#------------------------------------------------------------------------------

echo "##------ Building ImageMagick 7.10-55"
PKG="${DIR}/ImageMagick-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/ImageMagick-*
  ./configure --prefix=${PREFIX} --with-quantum-depth=16 --disable-dependency-tracking --with-x=no --without-perl --without-wmf
  make -j8
  make install
  clear
else
  echo "There was a problem with ImageMagick"
fi

#------------------------------------------------------------------------------

echo "##------ Building SQlite3 3.40.00"
PKG="${DIR}/sqlite-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/sqlite-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with SQLite3"
fi

#------------------------------------------------------------------------------

echo "##------ Building PHP8 8.2.0 (and 8.1.13)"
PKG="${DIR}/php*"
if [ -d ${PKG} ]; then
  cd ${DIR}/php*
  export LDFLAGS=-L/usr/local/custom/openssl/lib
  export CPPFLAGS=-I/usr/local/custom/openssl/include
  export PKG_CONFIG_PATH="/usr/local/custom/openssl/lib/pkgconfig"
  ./configure --prefix=${PREFIX} --with-config-file-path=${PREFIX}/lib --enable-bcmath --enable-cli --enable-exif --enable-mbstring --enable-gd --enable-gd-jis-conv --enable-sockets --enable-opcache --enable-simplexml --with-sqlite3 --enable-xmlreader --enable-xmlwriter --with-pdo-sqlite --with-bz2=${PREFIX} --with-curl --with-xsl --with-zlib --enable-gd --with-jpeg --with-iconv=${PREFIX} --with-openssl OPENSSL_CFLAGS=-I${PREFIX}/openssl/include OPENSSL_LIBS="-L${PREFIX}/openssl/lib -lssl -lcrypto" --without-pcre-jit --with-webp --with-freetype 
  make -j4
  make install
  clear
else
  echo "There was a problem with Ruby"
fi

#------------------------------------------------------------------------------

# Closing notes...
cd ${DIR}
echo "-------------------------------------------------------------------------------"
echo "Be sure to set the \$PATH variable in your .bash_login file (doesn't 
exist by default and you'll need to create it in your users' Home directory) 
as follows:

 export PATH='/usr/local/custom/bin:/usr/local/custom/sbin:/usr/local/bin:/usr/local/sbin:\$PATH'"
echo
echo "DONE! Enjoy. Now go build something awesome."
