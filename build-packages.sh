#!/bin/bash
# Compile the downloaded packages one at a time
# DEBUG: echo $(env)

#------------------------------------------------------------------------------

PKG=""

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

echo "##------ Building gettext"
PKG="${DIR}/gettext-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/gettext-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with gettext"
fi

#------------------------------------------------------------------------------

echo "##------ Building libxml2"
PKG="${DIR}/libxml2-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/libxml2-*
  ./configure --prefix=${PREFIX}/libxml2-2.7.3
  make
  make install
  cd /Library/Python/2.6/site-packages
  ln -s ${PREFIX}/libxml2-2.7.3/lib/python2.6/site-packages/* .
  clear
else
  echo "There was a problem with libxml2"
fi

#------------------------------------------------------------------------------

echo "##------ Building libxslt"
PKG="${DIR}/libxslt-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/libxslt-*
  ./configure --prefix=${PREFIX}/libxslt-1.1.24 --with-libxml-prefix=${PREFIX}/libxml2-2.7.3
  make
  make install
  cd /Library/Python/2.6/site-packages
  ln -s ${PREFIX}/libxslt-1.1.24/lib/python2.6/site-packages/* .
  clear
else
  echo "There was a problem with libxslt"
fi

#------------------------------------------------------------------------------

echo "##------ Building lxml"
PKG="${DIR}/lxml-*/"
if [ -d ${PKG} ]; then
  cd lxml-*
  python setup.py install --with-xml2-config=${PREFIX}/libxml2-2.7.3/bin/xml2-config --with-xslt-config=${PREFIX}/libxslt-1.1.24/bin/xslt-config
  clear
else
  echo "There was a problem with lxml"
fi

#------------------------------------------------------------------------------

echo "##------ Building django"
PKG="${DIR}/Django-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/Django-*
  python setup.py install
  clear
else
  echo "There was a problem with django"
fi

#------------------------------------------------------------------------------

echo "##------ Building neon"
PKG="${DIR}/neon-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/neon-*
  ./configure --prefix=${PREFIX} --enable-shared=yes --with-ssl=openssl --with-libxml2
  make
  make install
  clear
else
  echo "There was a problem with neon"
fi

#------------------------------------------------------------------------------

echo "##------ Building subversion"
PKG="${DIR}/subversion-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/subversion-*
  ./configure --prefix=${PREFIX} --disable-mod-activation --with-apxs=/usr/sbin/apxs --with-neon=${PREFIX} --without-berkeley-db --with-ssl --with-zlib=${PREFIX} --without-sasl
  make
  make install
  clear
else
  echo "There was a problem with subversion"
fi

#------------------------------------------------------------------------------

echo "##------ Building git"
PKG="${DIR}/git-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/git-*
  ./configure --prefix=${PREFIX}
  make all
  make install
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

echo "##------ Building lighttpd"
PKG="${DIR}/lighttpd-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/lighttpd-*
  ./configure --prefix=${PREFIX} --with-pcre=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with lighttpd"
fi

#------------------------------------------------------------------------------

echo "##------ Building fast-cgi"
PKG="${DIR}/fcgi-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/fcgi-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with fcgi"
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
PKG="${DIR}/ghostscript-8-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/ghostscript-8*
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
  ln -s /Developer/usr/bin/glibtool libtool
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
PKG="${DIR}/lcms-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/lcms-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with lcms"
fi

#------------------------------------------------------------------------------

echo "##------ Building libart2"
PKG="${DIR}/libart_*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/libart_*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
else
  echo "There was a problem with libart2"
fi

#------------------------------------------------------------------------------

echo "##------ Building imagemagick"
PKG="${DIR}/ImageMagick-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/ImageMagick-*
  ./configure --prefix=${PREFIX} --with-quantum-depth=16 --disable-dependency-tracking --with-x=yes --x-includes=/usr/X11R6/include --x-libraries=/usr/X11R6/lib --without-perl --without-wmf
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
  CC=gcc CFLAGS="-O3 -fno-omit-frame-pointer" CXX=gcc CXXFLAGS="-O3 -fno-omit-frame-pointer -felide-constructors -fno-exceptions -fno-rtti"
  ./configure --prefix=${PREFIX}/mysql --with-extra-charsets=complex --enable-thread-safe-client --enable-local-infile --enable-shared --with-zlib-dir=bundled --with-big-tables --with-readline --with-plugins=all --without-docs
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
  ./configure --prefix=${PREFIX} --enable-shared --with-readline-dir=${PREFIX} --enable-pthread CFLAGS=-D_XOPEN_SOURCE=1
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

echo "##------ Building ruby-fcgi"
PKG="${DIR}/ruby-fcgi-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/ruby-fcgi-*
  ${PREFIX}/bin/ruby install.rb config --prefix=${PREFIX}
  ${PREFIX}/bin/ruby install.rb setup
  ${PREFIX}/bin/ruby install.rb install
  clear
else
  echo "There was a problem with ruby-fcgi"
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

echo "##------ Building python mysql"
PKG="${DIR}/MySQL-python-*/"
if [ -d ${PKG} ]; then
  cd ${DIR}/MySQL-python-*
  python setup.py build
  python setup.py install
  clear
else
  echo "There was a problem with python mysql"
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
gem install fcgi
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
gem install ruby-openid
gem install rubypants
gem install salted_login_generator
gem install sparklines
gem install termios
gem install tiny
gem install xml-simple
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
 libexec/git-core:/usr/X11R6/bin:/Developer/usr/bin/:\$PATH'"
echo 
echo "Add the following line to your .bash_login file to properly use 
Mercurial's hg commands:

 export PYTHONPATH='/usr/local/lib/python:\$PYTHONPATH'"
echo
echo "DONE! Enjoy. Now go build something awesome."
