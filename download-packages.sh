#!/bin/bash

# Downloads the included packages and checks that the actual downloads 
# completed by verifying that the files exist on the local system

PACKAGES="http://mirrors.kernel.org/gnu/m4/m4-latest.tar.gz http://mirrors.kernel.org/gnu/autoconf/autoconf-latest.tar.gz http://mirrors.kernel.org/gnu/automake/automake-1.12.1.tar.gz http://mirrors.kernel.org/gnu/libtool/libtool-2.4.2.tar.gz http://www.zlib.net/zlib-1.2.8.tar.gz http://superb-dca2.dl.sourceforge.net/sourceforge/expat/expat-2.0.1.tar.gz http://pkgconfig.freedesktop.org/releases/pkg-config-0.25.tar.gz ftp://ftp.gnu.org/gnu/readline/readline-6.2.tar.gz http://downloads.sourceforge.net/project/pcre/pcre/8.32/pcre-8.32.tar.gz http://git-core.googlecode.com/files/git-1.8.3.1.tar.gz http://mercurial.selenic.com/release/mercurial-2.6.1.tar.gz http://www.apsis.ch/pound/Pound-2.6.tgz http://superb-dca2.dl.sourceforge.net/project/freetype/freetype2/2.5.0/freetype-2.5.0.tar.gz http://superb-dca2.dl.sourceforge.net/sourceforge/ghostscript/ghostscript-8.54-gpl.tar.gz http://voxel.dl.sourceforge.net/sourceforge/gs-fonts/ghostscript-fonts-std-8.11.tar.gz http://www.ijg.org/files/jpegsrc.v9.tar.gz ftp://ftp.remotesensing.org/libtiff/tiff-4.0.0.tar.gz http://downloads.sourceforge.net/project/libpng/libpng16/1.6.2/libpng-1.6.2.tar.gz http://iweb.dl.sourceforge.net/project/lcms/lcms/2.3/lcms2-2.3.tar.gz ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick.tar.gz http://sqlite.org/2013/sqlite-autoconf-3071700.tar.gz http://mysql.mirror.iweb.ca/Downloads/MySQL-5.1/mysql-5.1.65.tar.gz http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p429.tar.gz http://rubyforge.org/frs/download.php/76073/rubygems-1.8.24.tgz http://rubyforge.org/frs/download.php/69181/mysql-ruby-2.8.2.tar.gz http://rubyforge.org/frs/download.php/71617/sqlite3-ruby-1.3.1.tgz"

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