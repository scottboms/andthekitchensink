#!/bin/bash

# Downloads the included packages and checks that the actual downloads 
# completed by verifying that the files exist on the local system

PACKAGES="http://mirrors.kernel.org/gnu/m4/m4-latest.tar.gz http://mirrors.kernel.org/gnu/autoconf/autoconf-latest.tar.gz http://ftp.gnu.org/gnu/automake/automake-1.15.1.tar.gz http://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.gz http://www.zlib.net/zlib-1.2.11.tar.gz http://superb-dca2.dl.sourceforge.net/sourceforge/expat/expat-2.0.1.tar.gz http://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz ftp://ftp.gnu.org/gnu/readline/readline-6.3.tar.gz https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.28.0.tar.gz https://www.mercurial-scm.org/release/mercurial-5.4.1.tar.gz http://download.savannah.gnu.org/releases/freetype/freetype-2.9.1.tar.gz https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921/ghostscript-9.21.tar.gz http://superb-dca2.dl.sourceforge.net/sourceforge/gs-fonts/ghostscript-fonts-std-8.11.tar.gz http://www.ijg.org/files/jpegsrc.v9d.tar.gz http://download.osgeo.org/libtiff/tiff-4.1.0.tar.gz https://sourceforge.net/projects/libpng/files/libpng16/1.6.37/libpng-1.6.37.tar.gz http://sourceforge.net/projects/lcms/files/lcms/2.11/lcms2-2.11.tar.gz ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick.tar.gz https://www.openssl.org/source/openssl-1.1.1g.tar.gz https://www.sqlite.org/2020/sqlite-autoconf-3320200.tar.gz http://mysql.mirror.iweb.ca/Downloads/MySQL-5.1/mysql-5.1.65.tar.gz https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.1.tar.gz http://rubyforge.org/frs/download.php/71617/sqlite3-ruby-1.3.1.tgz
https://gmplib.org/download/gmp/gmp-6.2.0.tar.lz
https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.13.tar.xz
https://ftp.gnu.org/gnu/nettle/nettle-3.6.tar.gz
https://marlam.de/msmtp/releases/msmtp-1.8.10.tar.xz"

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