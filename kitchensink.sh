#!/bin/sh

#########################################################################################################
#                                                                                                       #
# Install Ruby, Subversion, Apache2, ImageMagick, Rails, Django and numerous useful development         #
# and deployment tools on Mac OS X Leopard systems                                                      #
#                                                                                                       #
# REQUIREMENTS                                                                                          #
# * Mac OS X Leopard 10.5.x                                                                             #
# * Xcode developer tools (free with Mac OS X or Apple Developer Connection)                            #
# * Administrative access (via sudo)                                                                    #
# * Internet connection (high speed preferrably)                                                        #
#                                                                                                       #
#                                                                                                       #
# OWNERSHIP and DISTRIBUTION                                                                            #
# Developed by Wishingline Design Studio, Inc.                                                          #
# This script may be freely distributed provided that this introductory                                 #
# notice is not altered or removed in any way.                                                          #
#                                                                                                       #
# If you wish to contribute to a future version of the script, please send                              #
# comments and suggestions by visiting www.wishingline.com/contact.                                     #
#                                                                                                       #
#########################################################################################################
#                                                                                                       #
# INSTRUCTIONS AND SETUP                                                                                #
# Before executing this script, please complete the following                                           #
#                                                                                                       #
# 1. Create a new file named ".bash_login" in your home directory. The period in the file name is       #
#    important. You can do this by typing the following at a new prompt:                                #
#                                                                                                       #
#    touch .bash_login                                                                                  #
#                                                                                                       #
# 2. Edit this file in your preferred plain text editor (TextMate, BBEdit)                              #
# and add the following in the file:                                                                    #
#                                                                                                       #
# export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/apache2/bin:$PATH"        #
# export MANPATH="/usr/local/man:/usr/local/apache2/man:$MANPATH"                                       #
#                                                                                                       #
# Save the file and reload the Terminal environment by typing:                                          #
#                                                                                                       #
# ~/.bash_login                                                                                         #
#                                                                                                       #
# 3. To run the script, simply type the following at a new prompt:                                      #
#                                                                                                       #
# ./kitchensink.sh                                                                                      #
#                                                                                                       #
# The script will run, downloading and compiling the necessary source to build custom binaries for      #
# your system(s). The script has been tested on both PowerPC and Intel flavour Macs or varying age      #
# and should work for you. Like anything, YMMV.                                                         #
#                                                                                                       #
#########################################################################################################

PREFIX=/usr/local
DIR=web_dev_env

mkdir ~/${DIR}
cd ~/${DIR}


# Readline 5.2
echo "--------------------------------------------------"
curl -O ftp://ftp.gnu.org/gnu/readline/readline-5.2.tar.gz
if [ -f "readline-5.2.tar.gz" ]; then
  tar zxf readline-5.2.tar.gz
  cd readline-5.2

  mkdir patches
  cd patches
  echo "Downloading patch files for Readline (1-12)"
  curl -O http://ftp.gnu.org/gnu/readline/readline-5.2-patches/readline52-001
  curl -O http://ftp.gnu.org/gnu/readline/readline-5.2-patches/readline52-002
  curl -O http://ftp.gnu.org/gnu/readline/readline-5.2-patches/readline52-003
  curl -O http://ftp.gnu.org/gnu/readline/readline-5.2-patches/readline52-004
  curl -O http://ftp.gnu.org/gnu/readline/readline-5.2-patches/readline52-005
  curl -O http://ftp.gnu.org/gnu/readline/readline-5.2-patches/readline52-006
  curl -O http://ftp.gnu.org/gnu/readline/readline-5.2-patches/readline52-007
  curl -O http://ftp.gnu.org/gnu/readline/readline-5.2-patches/readline52-008
  curl -O http://ftp.gnu.org/gnu/readline/readline-5.2-patches/readline52-009
  curl -O http://ftp.gnu.org/gnu/readline/readline-5.2-patches/readline52-010
  curl -O http://ftp.gnu.org/gnu/readline/readline-5.2-patches/readline52-011
  curl -O http://ftp.gnu.org/gnu/readline/readline-5.2-patches/readline52-012

  cd ..

  echo "Patching Readline..."
  patch < patches/readline52-001
  patch < patches/readline52-002
  patch < patches/readline52-003
  patch < patches/readline52-004
  patch < patches/readline52-005
  patch < patches/readline52-006
  patch < patches/readline52-007
  patch < patches/readline52-008
  patch < patches/readline52-009
  patch < patches/readline52-010
  patch < patches/readline52-011
  patch support/shobj-conf patches/readline52-012

  echo "Done patching Readline..."

  ./configure --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# zlib 1.2.3
echo "--------------------------------------------------"
echo "Installing zlib"
curl -O http://www.zlib.net/zlib-1.2.3.tar.gz
if [ -f "zlib-1.2.3.tar.gz" ]; then
  tar zxf zlib-1.2.3.tar.gz

  cd zlib-1.2.3
  ./configure --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# LibXML2 (with LibXSLT and lxml for Python)
# Assumes the use of the default install of Python in Mac OS X
echo "--------------------------------------------------"
echo "Installing LibXML2"
curl -O ftp://xmlsoft.org/libxml2/libxml2-2.7.3.tar.gz
if [ -f "testfile" ]; then
  tar -zxf libxml2-2.7.3.tar.gz
  cd libxml2-2.7.3
  ./configure --prefix=${PREFIX}/libxml2-2.7.3
  make
  sudo make install

  cd /Library/Python/2.5/site-packages
  sudo ln -s ${PREFIX}/libxml2-2.7.3/lib/python2.5/site-packages/* .
  cd ~/${DIR}
fi

# LibXSLT
echo "--------------------------------------------------"
echo "Installing LibXSLT"
curl -O ftp://xmlsoft.org/libxml2/libxslt-1.1.24.tar.gz
if [ -f "libxslt-1.1.24.tar.gz" ]; then
  tar -zxf libxslt-1.1.24.tar.gz
  cd libxslt-1.1.24
  ./configure --prefix=${PREFIX}/libxslt-1.1.24 --with-libxml-prefix=${PREFIX}/libxml2-2.7.3
  make
  sudo make install

  cd /Library/Python/2.5/site-packages
  sudo ln -s ${PREFIX}/libxslt-1.1.24/lib/python2.5/site-packages/* .
  cd ~/${DIR}
fi

# lxml
echo "--------------------------------------------------"
echo "Installing lxml"
curl -O http://codespeak.net/lxml/lxml-2.2.tgz
if [ -f "lxml-2.2.tar.gz" ]; then
  tar -zxf lxml-2.2.tgz
  cd lxml-2.2

  sudo python setup.py install \
    --with-xml2-config=${PREFIX}/libxml2-2.7.3/bin/xml2-config \
    --with-xslt-config=${PREFIX}/libxslt-1.1.24/bin/xslt-config
  cd ~/${DIR}
fi

# SQLite 3
echo "--------------------------------------------------"
echo "Installing SQLite3"
curl -O http://www.sqlite.org/sqlite-amalgamation-3.6.13.tar.gz
if [ -f "sqlite-amalgamation-3.6.13.tar.gz" ]; then
  tar zxf sqlite-amalgamation-3.6.13.tar.gz
  cd sqlite-3.6.13
  ./configure --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# Expat
# http://downloads.sourceforge.net
echo "--------------------------------------------------"
echo "Installing expat Library"
curl -O http://superb-east.dl.sourceforge.net/sourceforge/expat/expat-2.0.1.tar.gz
if [ -f "expat-2.0.1.tar.gz" ]; then
  tar zxf expat-2.0.1.tar.gz
  cd expat-2.0.1
  ./configure --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# MySQL for Intel Mac
echo "--------------------------------------------------"
echo "Installing MySQL Server"
curl -O http://mirror.csclub.uwaterloo.ca/mysql/Downloads/MySQL-5.0/mysql-5.0.77.tar.gz
if [ -f "mysql-5.0.77.tar.gz" ]; then
  tar zxf mysql-5.0.77.tar.gz
  cd mysql-5.0.77
  CC=gcc CFlags="-03 -fno-omit-frame-pointer" CXX=gcc CXXFLAGS="-03 -fno-omit-frame-pointer -felide-constructors -fno-exceptions -fno-rtti"

  ./configure --prefix=${PREFIX}/mysql --with-extra-charsets=complex --localstatedir=${PREFIX}/mysql/data --libexecdir=${PREFIX}/mysql/bin --libdir=${PREFIX}/mysql/lib --with-server-suffix=-standard --enable-thread-safe-client --enable-local-infile --enable-shared --with-zlib-dir=bundled --with-big-tables --with-readline --with-archive-storage-engine --with-innodb --without-docs --without-bench 
  make
  sudo make install
fi

cd ${PREFIX}/mysql
sudo ./bin/mysql_install_db --user=mysql
sudo chown -R mysql data


# MySQL 5.1.x for Intel Mac (Optional)
# echo "--------------------------------------------------"
# curl -O http://mysql.mirror.rafal.ca/Downloads/MySQL-5.1/mysql-5.1.33.tar.gz
# tar zxf mysql-5.1.33.tar.gz
# cd mysql-5.1.33
# CC=gcc CFlags="-03 -fno-omit-frame-pointer" CXX=gcc CXXFLAGS="-03 -fno-omit-frame-pointer -felide-constructors -fno-exceptions -fno-rtti"
# 
# ./configure --prefix=${PREFIX}/mysql --with-extra-charsets=complex --localstatedir=${PREFIX}/mysql/data --libexecdir=${PREFIX}/mysql/bin --libdir=${PREFIX}/mysql/lib --with-server-suffix=-standard --enable-thread-safe-client --enable-local-infile --enable-shared --with-zlib-dir=bundled --with-big-tables --with-readline --with-archive-storage-engine --with-innodb --without-docs --without-bench 
# make
# sudo make install
# 
# cd ${PREFIX}/mysql
# sudo ./bin/mysql_install_db --user=mysql
# sudo chown -R mysql data


# Ruby
# http://www.ruby-lang.org/en/
echo "--------------------------------------------------"
echo "Installing Ruby"
curl -O ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p72.tar.gz
if [ -f "ruby-1.8.7-p72.tar.gz" ]; then
  tar xzf ruby-1.8.7-p72.tar.gz 
  cd ruby-1.8.7-p72
  ./configure --prefix=${PREFIX} --enable-shared --with-readline-dir=${PREFIX} --enable-pthread CFLAGS=-D_XOPEN_SOURCE=1
  make
  sudo make install
  sudo make install-doc
  cd ~/${DIR}
fi

# Rubygems
# http://rubyforge.org/projects/rubygems/
echo "--------------------------------------------------"
echo "Installing Rubygems"
curl -OL http://rubyforge.org/frs/download.php/45905/rubygems-1.3.1.tgz
if [ -f "rubygems-1.3.1.tgz" ]; then
  tar xzf rubygems-1.3.1.tgz
  cd rubygems-1.3.1
  sudo ${PREFIX}/bin/ruby setup.rb
  cd ~/${DIR}
fi

# FastCGI
echo "--------------------------------------------------"
echo "Installing FastCGI"
curl -O http://www.fastcgi.com/dist/fcgi-2.4.0.tar.gz
if [ -f "fcgi-2.4.0.tar.gz" ]; then
  tar xzf fcgi-2.4.0.tar.gz
  cd fcgi-2.4.0
  ./configure --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# Ruby FastCGI Bindings
# http://rubyforge.org/projects/fcgi/
echo "--------------------------------------------------"
echo "Installing Ruby FastCGI Bindings"
curl -O http://rubyforge.iasi.roedu.net/files/fcgi/ruby-fcgi-0.8.7.tar.gz
if [ -f "ruby-fcgi-0.8.7.tar.gz" ]; then
  tar xzf ruby-fcgi-0.8.7.tar.gz
  cd ruby-fcgi-0.8.7
  ${PREFIX}/bin/ruby install.rb config --prefix=${PREFIX}
  ${PREFIX}/bin/ruby install.rb setup
  sudo ${PREFIX}/bin/ruby install.rb install
  cd ~/${DIR}
fi

# Ruby FastCGI Gem
echo "--------------------------------------------------"
echo "Installing Ruby FastCGI Gem"
sudo gem install fcgi


# gettext
# http://www.icewalkers.com/Linux/Software/513960/gettext.html
echo "--------------------------------------------------"
echo "Installing gettext"
curl -O ftp://ftp.gnu.org/gnu/gettext/gettext-0.17.tar.gz
if [ -f "gettext-0.17.tar.gz" ]; then
  tar -zxf gettext-0.17.tar.gz
  cd gettext-0.17
  ./configure --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# GIT
# http://git-scm.com
echo "--------------------------------------------------"
echo "Installing GIT"
curl -O http://kernel.org/pub/software/scm/git/git-1.6.2.3.tar.gz
if [ -f "git-1.6.2.3.tar.gz" ]; then
  tar -zxf git-1.6.2.3.tar.gz
  cd git-1.6*
  ./configure --prefix=${PREFIX}
  make all
  sudo make install
  cd ~/${DIR}
fi

# PCRE
# www.pcre.org
# CFLAGS=-01 is for Intel Macs, 02 is the default for PPC
echo "--------------------------------------------------"
echo "Installing PCRE"
curl -O ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-7.9.tar.gz
if [ -f "pcre-7.9.tar.gz" ]; then
  tar xzf pcre-7.9.tar.gz
  cd pcre-7.9
  ./configure --prefix=${PREFIX} CFLAGS=-01
  make
  sudo make install
  cd ~/${DIR}
fi

# Lighttpd
echo "--------------------------------------------------"
echo "Installing Lighttpd"
curl -O http://www.lighttpd.net/download/lighttpd-1.4.22.tar.gz
if [ -f "lighttpd-1.4.22.tar.gz" ]; then
  tar xzf lighttpd-1.4.22.tar.gz
  cd lighttpd-1.4.22
  ./configure --prefix=${PREFIX} --with-pcre=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# Ghostscript
# http://pages.cs.wisc.edu/~ghost/
echo "--------------------------------------------------"
echo "Installing Ghostscript"
curl -O http://superb-east.dl.sourceforge.net/sourceforge/ghostscript/ghostscript-8.54-gpl.tar.gz
if [ -f "ghostscript-8.54-gpl.tar.gz" ]; then
  tar zfx ghostscript-8.54-gpl.tar.gz
  cd ghostscript-8.54-gpl/
  ./configure --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# Ghostscript Fonts
# http://sourceforge.net/projects/gs-fonts/
echo "--------------------------------------------------"
echo "Installing Ghostscript-fonts"
curl -O http://voxel.dl.sourceforge.net/sourceforge/gs-fonts/ghostscript-fonts-std-8.11.tar.gz
if [ -f "ghostscript-fonts-std-8.11.tar.gz" ]; then
  tar zxf ghostscript-fonts-std-8.11.tar.gz
  sudo mv fonts ${PREFIX}/share/ghostscript
  cd ~/${DIR}
fi

# Freetype
# http://www.freetype.org
echo "--------------------------------------------------"
echo "Installing Freetype"
curl -O http://download.savannah.gnu.org/releases/freetype/freetype-2.3.5.tar.gz
tar xzf freetype-2.3.5.tar.gz
if [ -f "freetype-2.3.5.tar.gz" ]; then
  cd freetype-2.3.5
  ./configure --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# LibPNG
# http://www.libpng.org
echo "--------------------------------------------------"
echo "Installing LibPNG"
curl -O ftp://ftp.simplesystems.org/pub/libpng/png/src/libpng-1.2.35.tar.gz
if [ -f "libpng-1.2.35.tar.gz" ]; then
  tar zxf libpng-1.2.35.tar.gz
  cd libpng-1.2.35
  ./configure --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# LibJPEG
echo "--------------------------------------------------"
echo "Installing JPEG"
curl -O http://www.ijg.org/files/jpegsrc.v6b.tar.gz
if [ -f "jpegsrc.v6b.tar.gz" ]; then
  tar xzf jpegsrc.v6b.tar.gz
  cd jpeg-6b
  ln -s /Developer/usr/bin/glibtool libtool
  ./configure --enable-shared --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# LibTIFF
# http://www.remotesensing.org/libtiff/
echo "--------------------------------------------------"
echo "Installing TIFF"
curl -O ftp://ftp.remotesensing.org/libtiff/tiff-3.8.2.tar.gz
if [ -f "tiff-3.8.2.tar.gz" ]; then
  tar xzf tiff-3.8.2.tar.gz
  cd tiff-3.8.2
  ./configure --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# LibWMF
# http://wvware.sourceforge.net/libwmf.html
echo "--------------------------------------------------"
echo "Installing LibWMF"
curl -O http://jaist.dl.sourceforge.net/sourceforge/wvware/libwmf-0.2.8.4.tar.gz
if [ -f "libwmf-0.2.8.4.tar.gz" ]; then
  tar xzf libwmf-0.2.8.4.tar.gz
  cd libwmf-0.2.8.4
  ./configure --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# LCMS
echo "--------------------------------------------------"
echo "Installing LCMS"
curl -O http://www.littlecms.com/lcms-1.18.tar.gz
if [ -f "lcms-1.18.tar.gz" ]; then
  tar xzf lcms-1.18.tar.gz
  cd lcms-1.18
  ./configure --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# ImageMagick
echo "--------------------------------------------------"
echo "Installing ImageMagick"
curl -O ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick.tar.gz
if [ -f "ImageMagick.tar.gz" ]; then
  tar xzf ImageMagick.tar.gz
  cd ImageMagick-6.*
  ./configure --prefix=${PREFIX} --with-quantum-depth=16 --disable-dependency-tracking --with-x=yes --x-includes=/usr/X11R6/include --x-libraries=/usr/X11R6/lib --without-perl
  make
  sudo make install
  cd ~/${DIR}

  echo "--------------------------------------------------"
  echo "Installing RMagick"
  sudo gem install rmagick
fi

# Pound Load Balancer
echo "--------------------------------------------------"
echo "Installing Pound"
curl -O http://www.apsis.ch/pound/Pound-2.4.4.tgz
if [ -f "Pound-2.4.4.tar.gz" ]; then
  CFLAGS=""
  tar xzf Pound-2.4.4.tgz
  cd Pound-2.4.4
  ./configure --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# Neon
echo "--------------------------------------------------"
echo "Installing Neon"
curl -O http://www.webdav.org/neon/neon-0.28.3.tar.gz
if [ -f "neon-0.28.3.tar.gz" ]; then
  tar xzf neon-0.28.3.tar.gz
  cd neon-0.28.3
  ./configure --prefix=${PREFIX} --enable-shared=yes --with-ssl=openssl --with-libxml2
  make
  sudo make install
  cd ~/${DIR}
fi

# LibArt 2
echo "--------------------------------------------------"
echo "Installing LibArt 2"
curl -O http://ftp.acc.umu.se/pub/GNOME/sources/libart_lgpl/2.3/libart_lgpl-2.3.20.tar.gz
if [ -f "libart_lgpl-2.3.20.tar.gz" ]; then
  tar xzf libart_lgpl-2.3.20.tar.gz
  cd libart_lgpl-2.3.20
  ./configure --prefix=${PREFIX}
  make
  sudo make install
  cd ~/${DIR}
fi

# Rails
# http://www.rubyonrails.org
echo "--------------------------------------------------"
echo "Installing Rails with Dependencies"
sudo gem install rails
sudo gem install rails -v 1.2.6


# Mongrel
# http://mongrel.rubyforge.org
echo "--------------------------------------------------"
echo "Installing Mongrel Server"
sudo gem install mongrel -y


# Subversion 1.5.x Series
echo "--------------------------------------------------"
echo "Requires neon version 0.28.3 in order to use HTTP or HTTPS connections"
echo "Installing Subversion 1.5"
curl -O http://subversion.tigris.org/downloads/subversion-1.5.6.tar.gz
if [ -f "subversion-1.5.6.tar.gz" ]; then
  tar xzf subversion-1.5.6.tar.gz
  cd subversion-1.5.6
  ./configure --prefix=${PREFIX} --disable-mod-activation --with-apxs=/usr/sbin/apxs --with-neon=${PREFIX} --without-berkeley-db --with-ssl --with-zlib=${PREFIX} --without-sasl
  make
  sudo make install
  cd ~/${DIR}
fi

# Subversion 1.6.x Series
# echo "--------------------------------------------------"
# echo "Installing Subversion 1.6"
# curl -O http://subversion.tigris.org/downloads/subversion-1.6.1.tar.gz
# if [ -f "subversion-1.6.1.tar.gz" ]; then
#   tar xzf subversion-1.6.1.tar.gz
#   cd subversion-1.6.1
#   ./configure --prefix=${PREFIX} --disable-mod-activation --with-apxs=/usr/sbin/apxs --with-sqlite=${PREFIX} --with-neon=${PREFIX} --without-berkeley-db --with-ssl --with-zlib=${PREFIX} --without-sasl
#   make
#   sudo make install
#   cd ~/${DIR}
# fi

# MySQL Config File
sudo touch /etc/my.cnf
sudo echo "[mysqld]" >> /etc/my.cnf
sudo echo "bind-address = 127.0.0.1" >> /etc/my.cnf


# MySQL Startup Item
sudo touch /Library/LaunchDaemons/com.mysql.mysqld.plist
sudo cat > /Library/LaunchDaemons/com.mysql.mysqld.plist << "EOF"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>KeepAlive</key>
  <true/>
  <key>Label</key>
  <string>com.mysql.mysqld</string>
  <key>Program</key>
  <string>/usr/local/mysql/bin/mysqld_safe</string>
  <key>RunAtLoad</key>
  <true/>
  <key>UserName</key>
  <string>mysql</string>
  <key>WorkingDirectory</key>
  <string>/usr/local/mysql</string>
</dict>
</plist>
EOF

sudo launchctl load -w /Library/LaunchDaemons/com.mysql.mysqld.plist


# Ruby MySQL Gem
echo "--------------------------------------------------"
echo "Installing MySQL Ruby Gem"
sudo env ARCHFLAGS="-arch i386" gem install mysql -- --with-mysql-config=${PREFIX}/mysql/bin/mysql_config


# Ruby MySQL Gem Performance Patch
echo "--------------------------------------------------"
echo "Patching MySQL Ruby Gem"
curl -O http://and-the-kitchen-sink-plus.googlecode.com/files/mysql-ruby-2.7-less-string-copies-in-each-hash.diff
if [ -f "mysql-ruby-2.7-less-string-copies-in-each-hash.diff" ]; then
  sudo patch /usr/local/lib/ruby/gems/1.8/gems/mysql-2.7/mysql.c.in ~/${DIR}/mysql-ruby-2.7-less-string-copies-in-each-hash.diff
fi

# MySQL Python Driver
# http://internap.dl.sourceforge.net/sourceforge/mysql-python/MySQL-python-1.2.2.tar.gz
# Note, if using source download, it needs to be patched to compile in Mac OS X  10.5.x
# http://www.wishingline.com/downloads/kitchensink/mysql-python-1.2.2.zip
echo "--------------------------------------------------"
curl -O http://and-the-kitchen-sink-plus.googlecode.com/files/mysql-python-1.2.2.zip
if [ -f "mysql-python-1.2.2.zip" ]; then
  echo "Installing MySQL-python"
  unzip -q mysql-python-1.2.2.zip
  cd MySQL-python-1.2.2
  sudo python setup.py build
  sudo python setup.py install
  cd ~/${DIR}
fi

# Django
echo "--------------------------------------------------"
curl -O http://media.djangoproject.com/releases/1.0.2/Django-1.0.2-final.tar.gz
if [ -f "Django-1.0.2-final.tar.gz" ]; then
  echo "Installing Django"
  tar -zxf Django-1.0.2-final.tar.gz
  cd Django-1.0.2-final
  sudo python setup.py install
  cd ~/${DIR}
fi

# Other Ruby Gems
echo "--------------------------------------------------"
echo "Installing Other Ruby Gems..."
sudo gem install activemerchant acts_as_ferret acts_as_searchable acts_as_taggable amazon-ec2 aws-s3 bcrypt-ruby BlueCloth builder capazon capistrano character-encodings chronic columnize fcgi ferret flickraw gruff has_many_through_generator hoe hpricot htmlentities htmltools json_pure libxml-ruby login_generator magic_multi_connections memcache-client mime-types mocha mofo money needle net-scp net-sftp net-ssh net-ssh-gateway openid_login_generator paginator passenger payment piston rack radiant rapt rb-appscript RedCloth rmagick rspec rubigen ruby-openid ruby-prof ruby-yadis ruby2ruby rubyforge rubynode rubypants salted_login_generator sources sparklines sqlite3-ruby termios tidy tzinfo uuidtools xml-simple

# Juicer
# http://www.cjohansen.no/en/ruby/juicer_a_css_and_javascript_packaging_tool

sudo gem install juicer
sudo juicer install yui_compressor
sudo juicer install jslint

# Usage:
# juicer merge myfile.css myotherfile.css css/third.css

# Closing Notes...
echo "--------------------------------------------------"
echo "Done!"
