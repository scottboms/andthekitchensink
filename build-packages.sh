#!/bin/bash
# Compile the downloaded packages one at a time
# DEBUG: echo $(env)

#------------------------------------------------------------------------------

echo "##------ Building pkg-config"
if [ -d ${DIR}/pkg-config-* ]; then
  cd ${DIR}/pkg-config-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building zlib"
if [ -d ${DIR}/zlib-* ]; then
  cd ${DIR}/zlib-*
  ./configure --prefix=${PREFIX}
  make -s
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building expat"
if [ -d ${DIR}/expat-* ]; then
  cd ${DIR}/expat-*
  ./configure --prefix=${PREFIX}
  make -s
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building readline"
if [ -d ${DIR}/readline-* ]; then
  cd ${DIR}/readline-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building pcre"
if [ -d ${DIR}/pcre-* ]; then
  cd ${DIR}/pcre-*
  ./configure --prefix=${PREFIX} CFLAGS=-01
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building gettext"
if [ -d ${DIR}/gettext-* ]; then
  cd ${DIR}/gettext-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building libxml2"
if [ -d ${DIR}/libxml2-* ]; then
  cd ${DIR}/libxml2-*
  ./configure --prefix=${PREFIX}/libxml2-2.7.3
  make
  make install
  cd /Library/Python/2.5/site-packages
  ln -s ${PREFIX}/libxml2-2.7.3/lib/python2.5/site-packages/* .
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building libxslt"
if [ -d ${DIR}/libxslt-* ]; then
  cd ${DIR}/libxslt-*
  ./configure --prefix=${PREFIX}/libxslt-1.1.24 --with-libxml-prefix=${PREFIX}/libxml2-2.7.3
  make
  make install
  cd /Library/Python/2.5/site-packages
  ln -s ${PREFIX}/libxslt-1.1.24/lib/python2.5/site-packages/* .
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building lxml"
if [ -d ${DIR}/lxml-* ]; then
  cd lxml-*
  python setup.py install --with-xml2-config=${PREFIX}/libxml2-2.7.3/bin/xml2-config --with-xslt-config=${PREFIX}/libxslt-1.1.24/bin/xslt-config
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building django"
if [ -d ${DIR}/Django-* ]; then
  cd ${DIR}/Django-*
  python setup.py install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building neon"
if [ -d ${DIR}/neon-* ]; then
  cd ${DIR}/neon-*
  ./configure --prefix=${PREFIX} --enable-shared=yes --with-ssl=openssl --with-libxml2
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building subversion"
if [ -d ${DIR}/subversion-* ]; then
  cd ${DIR}/subversion-*
  ./configure --prefix=${PREFIX} --disable-mod-activation --with-apxs=/usr/sbin/apxs --with-neon=${PREFIX} --without-berkeley-db --with-ssl --with-zlib=${PREFIX} --without-sasl
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building git"
if [ -d ${DIR}/git-* ]; then
  cd ${DIR}/git-*
  ./configure --prefix=${PREFIX}
  make all
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building mercurial"
if [ -d ${DIR}/mercurial-* ]; then
  cd ${DIR}/mercurial-*
  python setup.py install --force --home=${PREFIX}
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building lighttpd"
if [ -d ${DIR}/lighttpd-* ]; then
  cd ${DIR}/lighttpd-*
  ./configure --prefix=${PREFIX} --with-pcre=${PREFIX}
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building fast-cgi"
if [ -d ${DIR}/fcgi-* ]; then
  cd ${DIR}/fcgi-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building pound"
if [ -d ${DIR}/Pound-* ]; then
  cd ${DIR}/Pound-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building freetype"
if [ -d ${DIR}/freetype-* ]; then
  cd ${DIR}/freetype-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building ghostscript"
if [ -d ${DIR}/ghostscript-8* ]; then
  cd ${DIR}/ghostscript-8*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building ghostscript-fonts"
# Nothing to build for this package, install only
if [ -d ${DIR}/fonts ]; then
  cd ${DIR}
  mv fonts ${PREFIX}/share/ghostscript
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building libjpeg"
if [ -d ${DIR}/jpeg-* ]; then
  cd ${DIR}/jpeg-*
  ln -s /Developer/usr/bin/glibtool libtool
  ./configure --prefix=${PREFIX} --enable-shared
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building libtiff"
if [ -d ${DIR}/tiff-* ]; then
  cd ${DIR}/tiff-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building libpng"
if [ -d ${DIR}/libpng-* ]; then
  cd ${DIR}/libpng-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building libwmf"
if [ -d ${DIR}/libwmf-* ]; then
  cd ${DIR}/libwmf-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building lcms"
if [ -d ${DIR}/lcms-* ]; then
  cd ${DIR}/lcms-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building libart2"
if [ -d ${DIR}/libart_* ]; then
  cd ${DIR}/libart_*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building imagemagick"
if [ -d ${DIR}/ImageMagick-* ]; then
  cd ${DIR}/ImageMagick-*
  ./configure --prefix=${PREFIX} --with-quantum-depth=16 --disable-dependency-tracking --with-x=yes --x-includes=/usr/X11R6/include --x-libraries=/usr/X11R6/lib --without-perl
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building sqlite3"
if [ -d ${DIR}/sqlite-* ]; then
  cd ${DIR}/sqlite-*
  ./configure --prefix=${PREFIX}
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building mysql"
if [ -d ${DIR}/mysql-* ]; then
  cd ${DIR}/mysql-*
  CC=gcc CFLAGS="-O3 -fno-omit-frame-pointer" CXX=gcc CXXFLAGS="-O3 -fno-omit-frame-pointer -felide-constructors -fno-exceptions -fno-rtti"
  ./configure --prefix=${PREFIX}/mysql --with-extra-charsets=complex --enable-thread-safe-client --enable-local-infile --enable-shared --with-zlib-dir=bundled --with-big-tables --with-readline --with-plugins=all --without-docs
  make
  make install
  clear
fi

# Initial MySQL configuration and db setup is separate

#------------------------------------------------------------------------------

echo "##------ Building ruby"
if [ -d ${DIR}/ruby-1* ]; then
  cd ${DIR}/ruby-1*
  ./configure --prefix=${PREFIX} --enable-shared --with-readline-dir=${PREFIX} --enable-pthread CFLAGS=-D_XOPEN_SOURCE=1
  make
  make install
  make install-doc
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building rubygems"
if [ -d ${DIR}/rubygems-* ]; then
  cd ${DIR}/rubygems-*
  ${PREFIX}/bin/ruby setup.rb
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building ruby fast-cgi"
if [ -d ${DIR}/ruby-fcgi-* ]; then
  cd ${DIR}/ruby-fcgi-*
  ${PREFIX}/bin/ruby install.rb config --prefix=${PREFIX}
  ${PREFIX}/bin/ruby install.rb setup
  ${PREFIX}/bin/ruby install.rb install
  clear
fi

#------------------------------------------------------------------------------

echo "Building ruby-mysql"
if [ -d ${DIR}/mysql-ruby-* ]; then
  cd ${DIR}/mysql-ruby-*
  ruby extconf.rb --with-mysql-dir=${PREFIX}/mysql --with-mysql-include-dir=${PREFIX}/mysql/include/mysql --with-mysql-config=${PREFIX}/mysql/bin/mysql_config
  make
  make install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building ruby sqlite3"
if [ -d ${DIR}/sqlite3-ruby-* ]; then
  cd ${DIR}/sqlite3-ruby-*
  ruby setup.rb config --prefix=${PREFIX}
  ruby setup.rb setup
  ruby setup.rb install
  clear
fi

#------------------------------------------------------------------------------

echo "##------ Building python mysql"
if [ -d ${DIR}/MySQL-python-* ]; then
  cd ${DIR}/MySQL-python-*
  python setup.py build
  python setup.py install
  clear
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
