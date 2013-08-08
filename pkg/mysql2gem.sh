#!/bin/bash
# MySQL 2 for Ruby gem
#------------------------------------------------------------------------------
echo "##------ Building MySQL2 for Ruby Gem"

sudo env ARCHFLAGS="-arch x86_64" gem install mysql2 -- --with-mysql-dir=${PREFIX}/mysql

sudo install_name_tool -change libmysqlclient.18.dylib ${PREFIX}/mysql/lib/libmysqlclient.18.dylib ${PREFIX}/lib/ruby/gems/2.0.0/gems/mysql2-0.3.13/lib/mysql2/mysql2.bundle