#!/usr/bin/env bash
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
  echo "There was a problem with m4" >&2
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
  echo "There was a problem with autoconf" >&2
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
  echo "There was a problem with automake" >&2
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
  echo "There was a problem with libtool" >&2
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
  echo "There was a problem with pkg-config" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building cmake 3.26.3"
PKG="${DIR}/cmake-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/cmake-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with cmake" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building nasm 2.16.01"
PKG="${DIR}/nasm-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/nasm-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with nasm" >&2
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
  echo "There was a problem with zLib" >&2
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
  echo "There was a problem with PCRE2" >&2
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
  echo "There was a problem with re2c" >&2
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
  echo "There was a problem with YAML" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building Readline 8.2"
PKG="${DIR}/readline-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/readline-*
  ./configure --prefix=${PREFIX}
  make -s
  make install
  clear
else
  echo "There was a problem with Readline" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building gettext 0.21.1"
PKG="${DIR}/gettext-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/gettext-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with gettext" >&2
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
  echo "There was a problem with libonig" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building iconv 1.17"
PKG="${DIR}/iconv-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/iconv-*
  env CPPFLAGS=-I${PREFIX}/include LDFLAGS=-s ./configure --prefix=${PREFIX}
  make -j8
  libtool --finish /usr/local/custom/lib
  make install
  clear
else
  echo "There was a problem with iconv" >&2
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
  echo "There was a problem with Expat" >&2
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
  echo "There was a problem with bzip2" >&2
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
  echo "There was a problem with bison" >&2
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
  echo "There was a problem with gmp" >&2
fi

#------------------------------------------------------------------------------

## For Apple Silicon, change Darwin type below -- darwin64-x86_64-cc | darwin64-arm64-cc

echo "##------ Building OpenSSL 1.1.1t"
PKG="${DIR}/openssl-*/"
VERS="3.1.0"
if [ -d ${PKG} ]; then
  cd ${DIR}/openssl-*
  make configure
  ./configure --prefix=${PREFIX} shared enable-rc5 zlib darwin64-x86_64-cc no-asm
  make -j8
  # make test
  make install
  clear
else
  echo "There was a problem with OpenSSL 1.x" >&2
fi

#------------------------------------------------------------------------------

## For Apple Silicon, change Darwin type below -- darwin64-x86_64-cc | darwin64-arm64-cc

echo "##------ Building OpenSSL 3.1.0"
PKG="${DIR}/openssl-*/"
VERS="3.1.0"
SYMLINK="${PREFIX}/openssl"
if [ -d ${PKG} ]; then
  cd ${DIR}/openssl-*
  make configure
  ./configure --prefix=${PREFIX} shared enable-rc5 zlib darwin64-x86_64-cc no-asm
  make -j8
  # make test
  make install
  clear
else
  echo "There was a problem with OpenSSL 3.x" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building curl 7.86.0"
# Requires OpenSSL
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig

PKG="${DIR}/curl-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/curl-*
  ./configure --prefix=${PREFIX} --with-openssl
  make -j8
  make install
  clear
else
  echo "There was a problem with curl" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building wget2"

# Note: Builds, but there's an issue with linked libraries or something

PKG="${DIR}/wget2-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/wget2-*
  ./configure --prefix=${PREFIX} LDFLAGS=-L/usr/local/custom/lib CPPFLAGS=-I/usr/local/custom/include
  make -j8
  make install
  clear
else
  echo "There was a problem with wget2" >&2
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
  echo "There was a problem with LibXML2" >&2
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
  echo "There was a problem with LibXML2" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building git 2.40.1"

## MAYBE HAS PROBLEM WITH LIBICONV...
PKG="${DIR}/git-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/git-*
  make configure
  ./configure --prefix=${PREFIX} --with-openssl=${PREFIX} --with-iconv=${PREFIX}
  make all -j8
  make install install-doc install-html
  clear
else
  echo "There was a problem with git" >&2
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
  echo "There was a problem with libjpeg" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building jpeg-turbo 2.1.91"
PKG="${DIR}/libjpeg-turbo-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/libjpeg-turbo-*
  cmake -G"Unix Makefiles" . CMAKE_INSTALL_PREFIX=${PREFIX} -DWITH_JPEG8=1
  make -j8
  make install
  clear
else
  echo "There was a problem with libjpeg-turbo" >&2
fi


#------------------------------------------------------------------------------

echo "##------ Building libtiff 4.5.0"
PKG="${DIR}/tiff-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/tiff-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with libtiff" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building GIFLIB 5.2.1"
PKG="${DIR}/giflib-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/giflib-*
	./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with giflib" >&2
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
  echo "There was a problem with libpng" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building libwebp 1.30"
PKG="${DIR}/libwebp/"
if [ -d ${PKG} ]; then
  cd ${DIR}/libwebp
  ./autogen.sh
  ./configure --prefix=${PREFIX} --with-pnglibdir=${PREFIX}/lib --with-pngincludedir=${PREFIX}/include --with-jpeglibdir=${PREFIX}/lib --with-jpegincludedir=${PREFIX}/include --with-tifflibdir=${PREFIX}/lib --with-tiffincludedir=${PREFIX}/include --disable-gif
  make -j8
  make install
  clear
else
  echo "There was a problem with libpng" >&2
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
  echo "There was a problem with lcms" >&2
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
  echo "There was a problem with FreeType" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building FontConfig 2.14.0"
PKG="${DIR}/fontconfig-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/fontconfig-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with Ghostscript" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building Ghostscript 10.00.0"
# TODO: Look at fixing jpeg, webp, and png support, etc.
PKG="${DIR}/ghostscript-10*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/ghostscript-10*
  ./configure --prefix=${PREFIX} --with-libiconv=${PREFIX} --disable-compile-inits --disable-cups --disable-gtk --without-x CC="gcc -arch x86_64" CPP="gcc -E"
  make -j8
  make install
  clear
else
  echo "There was a problem with Ghostscript" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building ImageMagick 7.1.1-10"
PKG="${DIR}/ImageMagick-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/ImageMagick-*
  ./configure --prefix=${PREFIX} --with-quantum-depth=16 --disable-dependency-tracking --with-x=no --without-perl --without-wmf
  make -j8
  make install
  clear
else
  echo "There was a problem with ImageMagick" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building SQlite3 3.42.0"
PKG="${DIR}/sqlite-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/sqlite-*
  ./configure --prefix=${PREFIX}
  make -j8
  make install
  clear
else
  echo "There was a problem with SQLite3" >&2
fi

#------------------------------------------------------------------------------

echo "##------ Building PHP8 8.1.19 (and 8.2.6)"
PKG="${DIR}/php*"
if [ -d ${PKG} ]; then
  cd ${DIR}/php*
  export LDFLAGS=-L/usr/local/custom/lib
  export CPPFLAGS=-I/usr/local/custom/include
  export PKG_CONFIG_PATH="/usr/local/custom/lib/pkgconfig"
  ./configure --prefix=${PREFIX} --with-config-file-path=${PREFIX}/lib --enable-bcmath --enable-cli --enable-exif --enable-mbstring --enable-gd --enable-gd-jis-conv --enable-sockets --enable-opcache --enable-simplexml --with-sqlite3 --enable-xmlreader --enable-xmlwriter --with-pdo-sqlite --with-bz2=${PREFIX} --with-curl --with-xsl --with-zlib --enable-gd --with-jpeg --with-iconv=${PREFIX} --with-openssl OPENSSL_CFLAGS=-I${PREFIX}/include OPENSSL_LIBS="-L${PREFIX}/lib -lssl -lcrypto" --without-pcre-jit --with-webp --with-freetype 
  make -j4
  make install
  clear
else
  echo "There was a problem with PHP 8" >&2
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
