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

# mkdir ~/${DIR}
cd ~/${DIR}

# zlib 1.2.3
# http://www.zlib.net/zlib-1.2.3.tar.gz
echo "--------------------------------------------------"
echo "Installing zlib"
tar zxf zlib-1.2.3.tar.gz
cd zlib-1.2.3
./configure --prefix=${PREFIX}
make
sudo make install
cd ~/${DIR}


# SQLite 3
# http://www.sqlite.org/sqlite-3.6.6.2.tar.gz
echo "--------------------------------------------------"
echo "Installing SQLite3"
tar zxf sqlite-3.6.6.2.tar.gz
cd sqlite-3.6.6.2
./configure --prefix=${PREFIX}
make
sudo make install
cd ~/${DIR}


# Expat
# http://downloads.sourceforge.net
# http://superb-east.dl.sourceforge.net/sourceforge/expat/expat-2.0.1.tar.gz
echo "--------------------------------------------------"
echo "Installing expat Library"
curl - O curl -O http://superb-east.dl.sourceforge.net/sourceforge/expat/expat-2.0.1.tar.gz
tar zxf expat-2.0.1.tar.gz
cd expat-2.0.1
./configure --prefix=${PREFIX}
make
sudo make install
cd ~/${DIR}


# MySQL for Intel Mac
# http://mirror.csclub.uwaterloo.ca/mysql/Downloads/MySQL-5.0/mysql-5.0.67.tar.gz
echo "--------------------------------------------------"
echo "Installing MySQL Server"
tar zxf mysql-5.0.67.tar.gz
cd mysql-5.0.67
CC=gcc CFlags="-03 -fno-omit-frame-pointer" CXX=gcc CXXFLAGS="-03 -fno-omit-frame-pointer -felide-constructors -fno-exceptions -fno-rtti"

./configure --prefix=${PREFIX}/mysql --with-extra-charsets=complex --localstatedir=${PREFIX}/mysql/data --libexecdir=${PREFIX}/mysql/bin --libdir=${PREFIX}/mysql/lib --with-server-suffix=-standard --enable-thread-safe-client --enable-local-infile --enable-shared --with-zlib-dir=bundled --with-big-tables --with-readline --with-archive-storage-engine --with-innodb --without-docs --without-bench 
make
sudo make install

cd /usr/local/mysql
sudo ./bin/mysql_install_db --user=mysql
sudo chown -R mysql data


# Ruby
# http://www.ruby-lang.org/en/
# http://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p114.tar.gz
echo "--------------------------------------------------"
echo "Installing Ruby"
tar xzf ruby-1.8.6-p114.tar.gz 
cd ruby-1.8.6-p114
./configure --prefix=${PREFIX} --enable-shared --enable-pthread CFLAGS=-D_XOPEN_SOURCE=1
make
sudo make install
sudo make install-doc
cd ~/${DIR}


# Rubygems
# http://rubyforge.org/projects/rubygems/
# http://rubyforge.org/frs/download.php/45905/rubygems-1.3.1.tgz
echo "--------------------------------------------------"
echo "Installing Rubygems"
tar xzf rubygems-1.3.1.tgz
cd rubygems-1.3.1
sudo ${PREFIX}/bin/ruby setup.rb
cd ~/${DIR}


# FastCGI
# http://www.fastcgi.com/dist/fcgi-2.4.0.tar.gz
echo "--------------------------------------------------"
echo "Installing FastCGI"
tar xzf fcgi-2.4.0.tar.gz
cd fcgi-2.4.0
./configure --prefix=${PREFIX}
make
sudo make install
cd ~/${DIR}


# Ruby FastCGI Bindings
# http://rubyforge.org/projects/fcgi/
# http://rubyforge.iasi.roedu.net/files/fcgi/ruby-fcgi-0.8.7.tar.gz
echo "--------------------------------------------------"
echo "Installing Ruby FastCGI Bindings"
tar xzf ruby-fcgi-0.8.7.tar.gz
cd ruby-fcgi-0.8.7
${PREFIX}/bin/ruby install.rb config --prefix=${PREFIX}
${PREFIX}/bin/ruby install.rb setup
sudo ${PREFIX}/bin/ruby install.rb install
cd ~/${DIR}


# Ruby FastCGI Gem
echo "--------------------------------------------------"
echo "Installing Ruby FastCGI Gem"
sudo gem install fcgi


# gettext
# http://www.icewalkers.com/Linux/Software/513960/gettext.html
# ftp://ftp.gnu.org/gnu/gettext/gettext-0.17.tar.gz
echo "--------------------------------------------------"
echo "Installing gettext"
tar -zxf gettext-0.17.tar.gz
cd gettext-0.17
./configure --prefix=${PREFIX}
make
sudo make install
cd ~/${DIR}


# GIT
# http://git.or.cz
# http://kernel.org/pub/software/scm/git/git-1.6.0.5.tar.gz
echo "--------------------------------------------------"
echo "Installing GIT"
tar -zxf git-1.6.0.5.tar.gz
cd git-1.6*
./configure --prefix=${PREFIX}
make all
sudo make install
cd ~/${DIR}


# PCRE
# www.pcre.org
# ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-7.2.tar.gz
# CFLAGS=-01 is for Intel Macs, 02 is the default for PPC
echo "--------------------------------------------------"
echo "Installing PCRE"
tar xzf pcre-7.2.tar.gz
cd pcre-7.2
./configure --prefix=${PREFIX} CFLAGS=-01
make
sudo make install
cd ~/${DIR}


# Lighttpd
# http://www.lighttpd.net/download/lighttpd-1.4.20.tar.gz
echo "--------------------------------------------------"
echo "Installing Lighttpd"
tar xzf lighttpd-1.4.20.tar.gz
cd lighttpd-1.4.20
./configure --prefix=${PREFIX} --with-pcre=${PREFIX}
make
sudo make install
cd ~/${DIR}


# Ghostscript
# http://pages.cs.wisc.edu/~ghost/
# http://superb-east.dl.sourceforge.net/sourceforge/ghostscript/ghostscript-8.54-gpl.tar.gz
echo "--------------------------------------------------"
echo "Installing Ghostscript"
tar zfx ghostscript-8.54-gpl.tar.gz
cd ghostscript-8.54-gpl/
./configure --prefix=${PREFIX}
make
sudo make install
cd ~/${DIR}


# Ghostscript Fonts
# http://sourceforge.net/projects/gs-fonts/
# http://voxel.dl.sourceforge.net/sourceforge/gs-fonts/ghostscript-fonts-std-8.11.tar.gz
echo "--------------------------------------------------"
echo "Installing Ghostscript-fonts"
tar zxf ghostscript-fonts-std-8.11.tar.gz
sudo mv fonts ${PREFIX}/share/ghostscript
cd ~/${DIR}


# Freetype
# http://www.freetype.org
# http://download.savannah.gnu.org/releases/freetype/freetype-2.3.5.tar.gz
echo "--------------------------------------------------"
echo "Installing Freetype"
tar xzf freetype-2.3.5.tar.gz
cd freetype-2.3.5
./configure --prefix=${PREFIX}
make
sudo make install
cd ~/${DIR}


# LibPNG
# http://www.libpng.org
# ftp://ftp.simplesystems.org/pub/libpng/png/src/libpng-1.2.33.tar.gz
echo "--------------------------------------------------"
echo "Installing LibPNG"
tar zxf libpng-1.2.33.tar.gz
cd libpng-1.2.33
./configure --prefix=${PREFIX}
make
sudo make install
cd ~/${DIR}


# LibJPEG
# http://www.ijg.org/files/jpegsrc.v6b.tar.gz
echo "--------------------------------------------------"
echo "Installing JPEG"
tar xzf jpegsrc.v6b.tar.gz
cd jpeg-6b
ln -s /Developer/usr/bin/glibtool libtool
./configure --enable-shared --prefix=${PREFIX}
make
sudo make install
cd ~/${DIR}


# LibTIFF
# http://www.remotesensing.org/libtiff/
# ftp://ftp.remotesensing.org/libtiff/tiff-3.8.2.tar.gz
echo "--------------------------------------------------"
echo "Installing TIFF"
tar xzf tiff-3.8.2.tar.gz
cd tiff-3.8.2
./configure --prefix=${PREFIX}
make
sudo make install
cd ~/${DIR}


# LibWMF
# http://wvware.sourceforge.net/libwmf.html
# http://jaist.dl.sourceforge.net/sourceforge/wvware/libwmf-0.2.8.4.tar.gz
echo "--------------------------------------------------"
echo "Installing LibWMF"
tar xzf libwmf-0.2.8.4.tar.gz
cd libwmf-0.2.8.4
./configure --prefix=${PREFIX}
make
sudo make install
cd ~/${DIR}


# LCMS
# http://www.littlecms.com/lcms-1.17.tar.gz
echo "--------------------------------------------------"
echo "Installing LCMS"
tar xzf lcms-1.17.tar.gz
cd lcms-1.17 
./configure --prefix=${PREFIX}
make
sudo make install
cd ~/${DIR}


# ImageMagick
# ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick.tar.gz
echo "--------------------------------------------------"
echo "Installing ImageMagick"
tar xzf ImageMagick.tar.gz
cd ImageMagick-6.*
./configure --prefix=${PREFIX} --with-quantum-depth=16 --disable-dependency-tracking --with-x=yes --x-includes=/usr/X11R6/include --x-libraries=/usr/X11R6/lib --without-perl
make
sudo make install
cd ~/${DIR}

echo "--------------------------------------------------"
echo "Installing RMagick"
sudo gem install rmagick


# Pound Load Balancer
# http://www.apsis.ch/pound/Pound-2.4.3.tgz
echo "--------------------------------------------------"
echo "Installing Pound"
CFLAGS=""
tar xzf Pound-2.4.3.tgz
cd Pound-2.4.3
./configure --prefix=${PREFIX}
make
sudo make install
cd ~/${DIR}


# Neon
# http://www.webdav.org/neon/neon-0.28.3.tar.gz
echo "--------------------------------------------------"
echo "Installing Neon"
tar xzf neon-0.28.3.tar.gz
cd neon-0.28.3
./configure --prefix=${PREFIX} --enable-shared=yes --with-ssl=openssl --with-libxml2
make
sudo make install
cd ~/${DIR}


# LibArt 2
# http://ftp.acc.umu.se/pub/GNOME/sources/libart_lgpl/2.3/libart_lgpl-2.3.20.tar.gz
echo "--------------------------------------------------"
echo "Installing LibArt 2"
tar xzf libart_lgpl-2.3.20.tar.gz
cd libart_lgpl-2.3.20
./configure --prefix=${PREFIX}
make
sudo make install
cd ~/${DIR}


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


# Subversion 1.5.x
# http://subversion.tigris.org/downloads/subversion-1.5.4.tar.gz
echo "--------------------------------------------------"
echo "Installing Subversion 1.5.x"
tar xzf subversion-1.5.4.tar.gz
cd subversion-1.5,4
./configure --prefix=${PREFIX} --disable-mod-activation --with-apxs=/usr/sbin/apxs --with-neon=${PREFIX} --without-berkeley-db --with-ssl --with-zlib=${PREFIX} --without-sasl
make
sudo make install
cd ~/${DIR}


# MySQL Config File
sudo touch /etc/my.cnf
sudo echo "[mysqld]" >> /etc/my.cnf
sudo echo "bind-address = 127.0.0.1" >> /etc/my.cnf


# MySQL Startup Item
sudo touch /Library/LaunchDaemons/com.mysql.mysqld.plist
sudo echo '<?xml version="1.0" encoding="UTF-8"?>'
sudo echo '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">'
sudo echo '<plist version="1.0">'
sudo echo '<dict>'
sudo echo '<key>KeepAlive</key>'
sudo echo '<true/>'
sudo echo '<key>Label</key>'
sudo echo '<string>com.mysql.mysqld</string>'
sudo echo '<key>Program</key>'
sudo echo '<string>/usr/local/mysql/bin/mysqld_safe</string>'
sudo echo '<key>RunAtLoad</key>'
sudo echo '<true/>'
sudo echo '<key>UserName</key>'
sudo echo '<string>mysql</string>'
sudo echo '<key>WorkingDirectory</key>'
sudo echo '<string>/usr/local/mysql</string>'
sudo echo '</dict>'
sudo echo '</plist>'

sudo launchctl load -w /Library/LaunchDaemons/com.mysql.mysqld.plist


# MySQL Gem
echo "--------------------------------------------------"
echo "Installing MySQL Ruby Gem"
sudo env ARCHFLAGS="-arch i386" gem install mysql -- --with-mysql-config=/usr/local/mysql/bin/mysql_config

# MySQL Python Driver
# http://internap.dl.sourceforge.net/sourceforge/mysql-python/MySQL-python-1.2.2.tar.gz
# Note, if using source download, it needs to be patched to compile in Mac OS X  10.5.x
echo "--------------------------------------------------"
echo "Installing MySQL-python"
unzip -q MySQL-python-1.2.2.zip
cd MySQL-python-1.2.2
sudo python setup.py build
sudo python setup.py install
cd ~/${DIR}


# Django
# http://media.djangoproject.com/releases/1.0.2/Django-1.0.2-final.tar.gz
echo "--------------------------------------------------"
echo "Installing Django"
tar -zxf Django-1.0.2-final.tar.gz
cd Django-1.0.2-final
sudo python setup.py install
cd ~/${DIR}


# Other Ruby Gems
echo "--------------------------------------------------"
echo "Installing Other Ruby Gems..."
sudo gem install abstract activemerchant acts_as_ferret acts_as_searchable acts_as_taggable amazon-ec2 ambition aws-s3 bcrypt-ruby BlueCloth builder cached_model capazon capistrano character-encodings cheat chronic columnize dnssd erubis fcgi ferret flickraw god gruff haml has_many_through_generator highline hoe hpricot htmlentities htmltools image_science json_pure libxml-ruby linecache login_generator magic_multi_connections mailfactory memcache-client merb mime-types mini_magick mocha mofo money needle net-scp net-sftp net-ssh net-ssh-gateway openid_login_generator paginator ParseTree passenger payment piston rack radiant railsbench rapt rb-appscript rchardet rcov RedCloth rfeedparser rmagick rspec rubigen ruby-debug ruby-debug-base ruby-openid ruby-prof ruby-yadis ruby2ruby rubyforge RubyInline rubynode rubypants salted_login_generator scrobbler simple-rss sources sparklines sproutcore sqlite3-ruby starling syntax termios test-spec tidy tzinfo uuidtools xml-simple ZenTest

# Closing Notes...
echo "--------------------------------------------------"
echo "Done!"
