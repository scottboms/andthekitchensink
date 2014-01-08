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
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with pkg-config"
fi

#------------------------------------------------------------------------------

echo "##------ Building zlib"
PKG="${DIR}/zlib-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/zlib-*
  ./configure --prefix=${PREFIX}
  make -s
  make install
  clear
else
  echo "There was a problem with zlib"
fi

#------------------------------------------------------------------------------

echo "##------ Building expat"
PKG="${DIR}/expat-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/expat-*
  ./configure --prefix=${PREFIX}
  make -s
  make install
  clear
else
  echo "There was a problem with expat"
fi

#------------------------------------------------------------------------------

echo "##------ Building readline"
PKG="${DIR}/readline-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/readline-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with readline"
fi

#------------------------------------------------------------------------------

echo "##------ Building pcre"
PKG="${DIR}/pcre-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/pcre-*
  ./configure --prefix=${PREFIX} CFLAGS=-01
  make
  make install
  clear
else
  echo "There was a problem with pcre"
fi

#------------------------------------------------------------------------------

echo "##------ Building git"
PKG="${DIR}/git-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/git-*
  make configure
  ./configure --prefix=${PREFIX}
  make all
  make install install-doc install-html
  clear
else
  echo "There was a problem with git"
fi

#------------------------------------------------------------------------------

echo "##------ Building mercurial"
PKG="${DIR}/mercurial-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/mercurial-*
  python setup.py install --force --home=${PREFIX}
  clear
else
  echo "There was a problem with mercurial"
fi

#------------------------------------------------------------------------------

echo "##------ Building pound"
PKG="${DIR}/Pound-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/Pound-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with pound"
fi

#------------------------------------------------------------------------------

echo "##------ Building freetype"
PKG="${DIR}/freetype-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/freetype-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with freetype"
fi

#------------------------------------------------------------------------------

echo "##------ Building ghostscript"
PKG="${DIR}/ghostscript-9-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/ghostscript-9*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with ghostscript"
fi

#------------------------------------------------------------------------------

echo "##------ Building ghostscript-fonts"
# Nothing to build for this package, install only
PKG="${DIR}/fonts/"
if [ -d ${PKG} ]; then
  cd ${DIR}
  mv fonts ${PREFIX}/share/ghostscript
  clear
else
  echo "There was a problem with ghostscript-fonts"
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

echo "##------ Building imagemagick"
PKG="${DIR}/ImageMagick-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/ImageMagick-*
  ./configure --prefix=${PREFIX} --with-quantum-depth=16 --disable-dependency-tracking --with-x=yes --x-includes=/opt/X11/include --x-libraries=/opt/X11/lib --without-perl --without-wmf
  make
  make install
  clear
else
  echo "There was a problem with imagemagick"
fi

#------------------------------------------------------------------------------

echo "##------ Building sqlite3"
PKG="${DIR}/sqlite-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/sqlite-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with sqlite3"
fi

#------------------------------------------------------------------------------

echo "##------ Building mysql"
PKG="${DIR}/mysql-5*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/mysql-5*
  CC=gcc CFLAGS="-O3 -fno-omit-frame-pointer" CXX=gcc CXXFLAGS="-O3 -fno-omit-frame-pointer -felide-constructors -fno-exceptions -fno-rtti" ./configure --prefix=${PREFIX}/mysql --with-extra-charsets=complex --enable-thread-safe-client --enable-local-infile --enable-shared --with-zlib-dir=bundled --with-big-tables --with-readline --with-plugins=all --without-docs
  make
  make install
  clear
else
  echo "There was a problem with mysql"
fi

# Initial MySQL configuration and db setup is separate

#------------------------------------------------------------------------------

echo "##------ Building ruby"
PKG="${DIR}/ruby-1*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/ruby-1*
  ./configure --prefix=${PREFIX} --enable-shared --enable-pthread CFLAGS=-D_XOPEN_SOURCE=1
  make
  make install
  make install-doc
  clear
else
  echo "There was a problem with ruby"
fi

#------------------------------------------------------------------------------

echo "##------ Building rubygems"
PKG="${DIR}/rubygems-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/rubygems-*
  ${PREFIX}/bin/ruby setup.rb
  clear
else
  echo "There was a problem with rubygems"
fi

#------------------------------------------------------------------------------

echo "Building ruby-mysql"
PKG="${DIR}/mysql-ruby-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/mysql-ruby-*
  ruby extconf.rb --with-mysql-dir=${PREFIX}/mysql --with-mysql-include-dir=${PREFIX}/mysql/include/mysql --with-mysql-config=${PREFIX}/mysql/bin/mysql_config
  make
  make install
  clear
else
  echo "There was a problem with ruby-mysql"
fi

#------------------------------------------------------------------------------

echo "##------ Building ruby-sqlite3"
PKG="${DIR}/sqlite3-ruby-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/sqlite3-ruby-*
  ruby setup.rb config --prefix=${PREFIX}
  ruby setup.rb setup
  ruby setup.rb install
  clear
else
  echo "There was a problem with ruby-sqlite3"
fi

#------------------------------------------------------------------------------

echo "##------ Installing ruby gems"
gem install rails
gem install activemerchant
gem install acts_as_ferret
gem install acts_as_searchable
gem install acts_as_taggable
gem install amazon-ec2
gem install aws-s3
gem install bcrypt-ruby
gem install BlueCloth
gem install capazon
gem install capistrano
gem install columnize
gem install ferret
gem install flickraw
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
gem install openid_login_generator
gem install paginator
gem install passenger
gem install payment
gem install piston
gme install radiant
gem install rb-appscript
gem install RedCloth
gem install rmagick
gem install rubypants
gem install salted_login_generator
gem install sparklines
gem install termios
gem install tiny
gem install xml-simple
gem install mysql2
clear

#------------------------------------------------------------------------------

echo "Installing extras"
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
