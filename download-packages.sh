#!/bin/bash

# Downloads the included packages and checks that the actual downloads 
# completed by verifying that the files exist on the local system

PACKAGES="http://mirrors.kernel.org/gnu/m4/m4-latest.tar.gz http://mirrors.kernel.org/gnu/autoconf/autoconf-latest.tar.gz http://mirrors.kernel.org/gnu/automake/automake-1.14.tar.gz http://mirrors.kernel.org/gnu/libtool/libtool-2.4.2.tar.gz http://www.zlib.net/zlib-1.2.8.tar.gz http://superb-dca2.dl.sourceforge.net/sourceforge/expat/expat-2.0.1.tar.gz http://pkgconfig.freedesktop.org/releases/pkg-config-0.28.tar.gz ftp://ftp.gnu.org/gnu/readline/readline-6.3.tar.gz https://www.kernel.org/pub/software/scm/git/git-2.2.1.tar.gz http://mercurial.selenic.com/release/mercurial-3.2.4.tar.gz  http://superb-dca2.dl.sourceforge.net/project/freetype/freetype2/2.5.0/freetype-2.5.0.tar.gz http://downloads.ghostscript.com/public/ghostscript-9.15.tar.gz http://superb-dca2.dl.sourceforge.net/sourceforge/gs-fonts/ghostscript-fonts-std-8.11.tar.gz http://www.ijg.org/files/jpegsrc.v9a.tar.gz ftp://ftp.remotesensing.org/libtiff/tiff-4.0.3.tar.gz http://sourceforge.net/projects/libpng/files/libpng16/1.6.15/libpng-1.6.15.tar.gz http://sourceforge.net/projects/lcms/files/lcms/2.6/lcms2-2.6.tar.gz ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick.tar.gz https://www.openssl.org/source/openssl-1.0.1j.tar.gz http://www.sqlite.org/2014/sqlite-autoconf-3080600.tar.gz http://mysql.mirror.iweb.ca/Downloads/MySQL-5.1/mysql-5.1.65.tar.gz http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz  http://rubyforge.org/frs/download.php/71617/sqlite3-ruby-1.3.1.tgz"

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