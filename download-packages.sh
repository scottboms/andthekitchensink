#!/usr/bin/env bash

# Downloads the included packages and checks that the actual downloads 
# completed by verifying that the files exist on the local system

PACKAGES="http://mirrors.kernel.org/gnu/m4/m4-latest.tar.gz http://mirrors.kernel.org/gnu/autoconf/autoconf-latest.tar.gz http://ftp.gnu.org/gnu/automake/automake-1.16.5.tar.gz http://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.gz http://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz https://github.com/Kitware/CMake/releases/download/v3.26.3/cmake-3.26.3.tar.gz http://www.zlib.net/zlib-1.2.13.tar.gz https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.42/pcre2-10.42.tar.gz https://github.com/skvadrik/re2c/releases/download/2.2/re2c-2.2.tar.xz https://github.com/yaml/libyaml/releases/download/0.2.5/yaml-0.2.5.tar.gz ftp://ftp.cwru.edu/pub/bash/readline-8.1.tar.gz https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz https://github.com/kkos/oniguruma/releases/download/v6.9.8/onig-6.9.8.tar.gz https://ftp.gnu.org/gnu/libiconv/libiconv-1.17.tar.gz https://github.com/libexpat/libexpat/releases/download/R_2_5_0/expat-2.5.0.tar.gz https://sourceware.org/pub/bzip2/bzip2-latest.tar.gz https://ftp.gnu.org/gnu/bison/bison-3.8.2.tar.gz https://gmplib.org/download/gmp/gmp-6.2.1.tar.xz https://www.openssl.org/source/openssl-1.1.1t.tar.gz https://github.com/curl/curl/releases/download/curl-7_86_0/curl-7.86.0.tar.gz ftp://xmlsoft.org//libxml2/libxml2-2.9.14.tar.gz ftp://xmlsoft.org//libxml2/libxslt-1.1.35.tar.gz https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.40.1.tar.gz https://download.savannah.gnu.org/releases/freetype/freetype-2.12.1.tar.gz https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs1000/ghostscript-10.00.0.tar.gz http://www.ijg.org/files/jpegsrc.v9e.tar.gz https://sourceforge.net/projects/libjpeg-turbo/files/2.1.91%20%283.0%20beta2%29/libjpeg-turbo-2.1.91.tar.gz http://download.osgeo.org/libtiff/tiff-4.5.0.tar.gz https://github.com/mldbai/giflib/archive/refs/tags/v5.1.4.tar.gz http://prdownloads.sourceforge.net/libpng/libpng-1.6.39.tar.gz https://github.com/webmproject/libwebp/archive/refs/tags/v1.3.0.tar.gz https://github.com/mm2/Little-CMS/releases/download/lcms2.14/lcms2-2.14.tar.gz https://imagemagick.org/archive/ImageMagick.tar.gz https://www.sqlite.org/2023/sqlite-autoconf-3410200.tar.gz https://www.php.net/distributions/php-8.2.5.tar.gz"

echo "Starting package downloads..."
echo "-------------------------------------------------------------------------------"

for package in ${PACKAGES}
do
  # Download a package
  curl -OL --silent ${package}

  # Get the name of the file downloaded from the URL in the $PACKAGES array
  FILENAME=`echo ${package##*/}`

  if [ -s "${FILENAME}" ]; then
    echo "${FILENAME} downloaded successfully"

    # Decompresss the downloaded file using tar
    tar -zxf ${FILENAME}
    echo "..."
  else
    echo "${FILENAME} did not download and the link may now be out of date"
  fi
done

echo "-------------------------------------------------------------------------------"
echo "Downloads and file verification complete"
exit 0