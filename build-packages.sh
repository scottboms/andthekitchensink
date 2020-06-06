#!/bin/bash
# Compile the downloaded packages one at a time
# DEBUG: echo $(env)

#------------------------------------------------------------------------------

PKG=""

echo "##------ Building m4"
PKG="${DIR}/m4-1*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/m4-1*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with m4"
fi

#------------------------------------------------------------------------------

echo "##------ Building autoconf"
PKG="${DIR}/autoconf-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/autoconf-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with autoconf"
fi

#------------------------------------------------------------------------------

echo "##------ Building automake"
PKG="${DIR}/automake-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/automake-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with automake"
fi

#------------------------------------------------------------------------------

echo "##------ Building libtool"
PKG="${DIR}/libtool-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/libtool-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with libtool"
fi

#------------------------------------------------------------------------------

echo "##------ Building pkg-config"
PKG="${DIR}/pkg-config-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/pkg-config-*
  ./configure --prefix=${PREFIX} --with-internal-glib
  make
  make install
  clear
else
  echo "There was a problem with pkg-config"
fi

#------------------------------------------------------------------------------

echo "##------ Building zLib"
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

echo "##------ Building OpenSSL"
PKG="${DIR}/openssl-*/"
VERS="1.1.0c"
SYMLINK="${PREFIX}/openssl"
if [ -d ${PKG} ]; then
  cd ${DIR}/openssl-*
  make configure
  ./configure darwin64-x86_64-cc --prefix=${PREFIX}/openssl-${VERS}
  make
  make test
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

echo "##------ Building git"
PKG="${DIR}/git-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/git-*
  make configure
  ./configure --prefix=${PREFIX} --with-openssl=${PREFIX}/openssl
  make all
  make install install-doc install-html
  clear
else
  echo "There was a problem with git"
fi

#------------------------------------------------------------------------------

echo "##------ Building Mercurial"
PKG="${DIR}/mercurial-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/mercurial-*
  python setup.py install --force --home=${PREFIX}
  clear
else
  echo "There was a problem with Mercurial"
fi

#------------------------------------------------------------------------------

echo "##------ Building msmtp"
PKG="${DIR}/msmtp-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/msmtp-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with msmtp"
fi

#------------------------------------------------------------------------------

echo "##------ Building FreeType"
PKG="${DIR}/freetype-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/freetype-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with FreeType"
fi

#------------------------------------------------------------------------------

echo "##------ Building Ghostscript"
PKG="${DIR}/ghostscript-9-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/ghostscript-9*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with Ghostscript"
fi

#------------------------------------------------------------------------------

echo "##------ Building Ghostscript Fonts"
# Nothing to build for this package, install only
PKG="${DIR}/fonts/"
if [ -d ${PKG} ]; then
  cd ${DIR}
  mv fonts ${PREFIX}/share/ghostscript/
  clear
else
  echo "There was a problem with Ghostscript Fonts"
fi

#------------------------------------------------------------------------------

echo "##------ Building libjpeg"
PKG="${DIR}/jpeg-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/jpeg-*
  # ln -s /Developer/usr/bin/glibtool libtool
  ./configure --prefix=${PREFIX} --enable-shared
  make
  make install
  clear
else
  echo "There was a problem with libjpeg"
fi

#------------------------------------------------------------------------------

echo "##------ Building libtiff"
PKG="${DIR}/tiff-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/tiff-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with libtiff"
fi

#------------------------------------------------------------------------------

echo "##------ Building libpng"
PKG="${DIR}/libpng-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/libpng-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with libpng"
fi

#------------------------------------------------------------------------------

echo "##------ Building lcms"
PKG="${DIR}/lcms2-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/lcms2-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with lcms"
fi

#------------------------------------------------------------------------------

echo "##------ Building ImageMagick"
PKG="${DIR}/ImageMagick-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/ImageMagick-*
  ./configure --prefix=${PREFIX} --with-quantum-depth=16 --disable-dependency-tracking --with-x=yes --x-includes=/opt/X11/include --x-libraries=/opt/X11/lib --without-perl --without-wmf
  make
  make install
  clear
else
  echo "There was a problem with ImageMagick"
fi

#------------------------------------------------------------------------------

echo "##------ Building SQlite3"
PKG="${DIR}/sqlite-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/sqlite-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with SQLite3"
fi

#------------------------------------------------------------------------------

echo "##------ Building MySQL"
PKG="${DIR}/mysql-5*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/mysql-5*
  CC=gcc CFLAGS="-O3 -fno-omit-frame-pointer" CXX=gcc CXXFLAGS="-O3 -fno-omit-frame-pointer -felide-constructors -fno-exceptions -fno-rtti" ./configure --prefix=${PREFIX}/mysql --with-extra-charsets=complex --enable-thread-safe-client --enable-local-infile --enable-shared --with-zlib-dir=bundled --with-big-tables --with-readline --with-plugins=all --without-docs
  make
  make install
  clear
else
  echo "There was a problem with MySQL"
fi

# Initial MySQL configuration and db setup is separate

#------------------------------------------------------------------------------

echo "##------ Building Ruby"
PKG="${DIR}/ruby-2*"
if [ -d ${PKG} ]; then
  cd ${DIR}/ruby-2*
  ./configure --prefix=${PREFIX} --with-opt-dir=${PREFIX}/openssl --enable-shared --with-readline-dir=${PREFIX} CFLAGS=-D_XOPEN_SOURCE=1
  make
  make test
  make install
  make install-doc
  clear
else
  echo "There was a problem with Ruby"
fi

#------------------------------------------------------------------------------

echo "##------ Updating Rubygems"

gem --version
gem update --system

#------------------------------------------------------------------------------

echo "Building MySQL2 Gem for Ruby"

sudo env ARCHFLAGS="-arch x86_64" gem install mysql2 -- --with-mysql-config=${PREFIX}/mysql/bin/mysql_config

sudo install_name_tool -change libmysqlclient.18.dylib ${PREFIX}/mysql/lib/libmysqlclient.18.dylib ${PREFIX}/lib/ruby/gems/2.1.0/gems/mysql2-0.3.15/lib/mysql2/mysql2.bundle


#------------------------------------------------------------------------------

echo "##------ Building SQLite3 for Ruby"
PKG="${DIR}/sqlite3-ruby-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/sqlite3-ruby-*
  ruby setup.rb config --prefix=${PREFIX}
  ruby setup.rb setup
  ruby setup.rb install
  clear
else
  echo "There was a problem with SQLite3 for Ruby"
fi

#------------------------------------------------------------------------------

echo "##------ Installing Misc. Ruby Gems"
gem install rails
gem install acts_as_ferret
gem install acts_as_searchable
gem install acts_as_taggable
gem install bcrypt-ruby
gem install BlueCloth
gem install capistrano
gem install columnize
gem install ferret
gem install gruff
gem install has_many_through_generator
gem install hpricot
gem install htmlentities
gem install json_pure
gem install libxml-ruby
gem install login_generator
gem install magic_multi_connections
gem install memcache-client
gem install mofo
gem install mongrel
gem install paginator
gem install payment
gem install piston
gem install RedCloth
gem install rmagick
gem install rubypants
gem install salted_login_generator
gem install sparklines
gem install termios
gem install tiny
gem install xml-simple
clear

#------------------------------------------------------------------------------

echo "Installing Extras"
gem install juicer
juicer install yui_compressor
juicer install jslint
clear

#------------------------------------------------------------------------------

# Closing notes...
cd ${DIR}
echo "-------------------------------------------------------------------------------"
echo "Be sure to set the \$PATH variable in your .bash_login file (doesn't 
exist by default and you'll need to create it in your users' Home directory) 
as follows:

 export PATH='/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/
 libexec/git-core:/opt/X11/bin:/Developer/usr/bin/:\$PATH'"
echo 
echo "Add the following line to your .bash_login file to properly use 
Mercurial's hg commands:

 export PYTHONPATH='/usr/local/lib/python:\$PYTHONPATH'"
echo
echo "DONE! Enjoy. Now go build something awesome."
