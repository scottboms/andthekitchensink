#!/bin/bash

# Downloads the included packages and checks that the actual downloads 
# completed by verifying that the files exist on the local system

PACKAGES="http://www.zlib.net/zlib-1.2.3.tar.gz http://superb-east.dl.sourceforge.net/sourceforge/expat/expat-2.0.1.tar.gz http://pkgconfig.freedesktop.org/releases/pkg-config-0.23.tar.gz ftp://ftp.gnu.org/gnu/readline/readline-6.1.tar.gz ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.0.tar.gz ftp://ftp.gnu.org/gnu/gettext/gettext-0.17.tar.gz http://www.webdav.org/neon/neon-0.28.3.tar.gz ftp://xmlsoft.org/libxml2/libxml2-2.7.3.tar.gz http://codespeak.net/lxml/lxml-2.2.2.tgz ftp://xmlsoft.org/libxml2/libxslt-1.1.24.tar.gz http://media.djangoproject.com/releases/1.2/Django-1.2.1.tar.gz http://subversion.tigris.org/downloads/subversion-1.5.6.tar.gz http://kernel.org/pub/software/scm/git/git-1.7.2.1.tar.gz http://mercurial.selenic.com/release/mercurial-1.6.tar.gz http://www.lighttpd.net/download/lighttpd-1.4.26.tar.gz http://www.fastcgi.com/dist/fcgi-2.4.0.tar.gz http://www.apsis.ch/pound/Pound-2.5.tgz http://internap.dl.sourceforge.net/sourceforge/freetype/freetype-2.3.9.tar.gz http://superb-east.dl.sourceforge.net/sourceforge/ghostscript/ghostscript-8.54-gpl.tar.gz http://voxel.dl.sourceforge.net/sourceforge/gs-fonts/ghostscript-fonts-std-8.11.tar.gz http://www.ijg.org/files/jpegsrc.v7.tar.gz ftp://ftp.remotesensing.org/libtiff/tiff-3.9.2.tar.gz ftp://ftp.simplesystems.org/pub/libpng/png/src/libpng-1.4.0.tar.gz http://www.littlecms.com/lcms-1.19.tar.gz http://ftp.acc.umu.se/pub/GNOME/sources/libart_lgpl/2.3/libart_lgpl-2.3.20.tar.gz ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick.tar.gz http://www.sqlite.org/sqlite-amalgamation-3.7.0.tar.gz http://mysql.mirror.rafal.ca/Downloads/MySQL-5.1/mysql-5.1.49.tar.gz ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.gz http://rubyforge.org/frs/download.php/70696/rubygems-1.3.7.tgz http://rubyforge.org/frs/download.php/11368/ruby-fcgi-0.8.7.tar.gz http://rubyforge.org/frs/download.php/69181/mysql-ruby-2.8.2.tar.gz http://rubyforge.org/frs/download.php/71617/sqlite3-ruby-1.3.1.tgz http://voxel.dl.sourceforge.net/sourceforge/mysql-python/MySQL-python-1.2.3c1.tar.gz"

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