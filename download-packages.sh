#!/bin/bash

# Downloads the included packages and checks that the actual downloads 
# completed by verifying that the files exist on the local system

PACKAGES="http://www.zlib.net/zlib-1.2.6.tar.gz http://superb-dca2.dl.sourceforge.net/sourceforge/expat/expat-2.0.1.tar.gz http://pkgconfig.freedesktop.org/releases/pkg-config-0.25.tar.gz ftp://ftp.gnu.org/gnu/readline/readline-6.2.tar.gz http://ftp.csx.cam.ac.uk/pcre-8.30.tar.gz ftp://ftp.gnu.org/gnu/gettext/gettext-0.17.tar.gz http://www.webdav.org/neon/neon-0.28.3.tar.gz ftp://xmlsoft.org/libxml2/libxml2-2.7.3.tar.gz http://codespeak.net/lxml/lxml-2.2.2.tgz ftp://xmlsoft.org/libxml2/libxslt-1.1.24.tar.gz http://media.djangoproject.com/releases/1.2/Django-1.2.1.tar.gz http://subversion.tigris.org/downloads/subversion-1.5.6.tar.gz http://git-core.googlecode.com/files/git-1.7.10.tar.gz http://mercurial.selenic.com/release/mercurial-2.0.2.tar.gz http://www.lighttpd.net/download/lighttpd-1.4.30.tar.gz http://www.fastcgi.com/dist/fcgi-2.4.0.tar.gz http://www.apsis.ch/pound/Pound-2.6.tgz http://superb-dca2.dl.sourceforge.net/project/freetype/freetype2/2.4.9/freetype-2.4.9.tar.gz http://superb-dca2.dl.sourceforge.net/sourceforge/ghostscript/ghostscript-8.54-gpl.tar.gz http://voxel.dl.sourceforge.net/sourceforge/gs-fonts/ghostscript-fonts-std-8.11.tar.gz http://www.ijg.org/files/jpegsrc.v8d.tar.gz ftp://ftp.remotesensing.org/libtiff/tiff-3.9.5.tar.gz http://superb-sea2.dl.sourceforge.net/project/libpng/libpng15/1.5.9/libpng-1.5.9.tar.gz http://iweb.dl.sourceforge.net/project/lcms/lcms/2.3/lcms2-2.3.tar.gz http://ftp.acc.umu.se/pub/GNOME/sources/libart_lgpl/2.3/libart_lgpl-2.3.20.tar.gz ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick.tar.gz http://sqlite.org/sqlite-autoconf-3071100.tar.gz http://mysql.mirror.iweb.ca/Downloads/MySQL-5.1/mysql-5.1.62.tar.gz http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.gz http://rubyforge.org/frs/download.php/75711/rubygems-1.8.15.tgz http://rubyforge.org/frs/download.php/11368/ruby-fcgi-0.8.7.tar.gz http://rubyforge.org/frs/download.php/69181/mysql-ruby-2.8.2.tar.gz http://rubyforge.org/frs/download.php/71617/sqlite3-ruby-1.3.1.tgz http://voxel.dl.sourceforge.net/sourceforge/mysql-python/MySQL-python-1.2.3c1.tar.gz"

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