#!/bin/bash

#-------------------------------------------------------------------------------
# Base configuration and variables

COMMAND="$1"
HOME=$(pwd)
export PREFIX="/usr/local"
export DIR=${HOME}/src
export ARCHFLAGS="-Os -arch x86_64 -fno-common"
export LC_CTYPE=en_US.UTF-8
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

#-------------------------------------------------------------------------------

if [ "$#" -eq 0 ]; then 
echo "-----------------------------------------------------------------------------
Please pass on of the following arguments to the script:\r\n
help          Print help information\r
download      Download all the included component source code\r
build         Will build all components in the 'packages' directory\r
setup-mysql   Will create the initial MySQL database, users and config files\r\n

For example: $ ./start.sh download
             $ sudo ./start.sh build
             $ sudo ./start.sh setup-mysql
-----------------------------------------------------------------------------"
elif [ $COMMAND = "download" ]; then
  echo ${DIR}
  mkdir -p ${DIR}
  cd ${DIR}
  sh ${HOME}/download-packages.sh
elif [ $COMMAND = "build" ]; then
  mkdir -p ${DIR}
  sh ${HOME}/build-packages.sh
elif [ $COMMAND = "setup-mysql" ]; then
  sh ${HOME}/setup-mysql.sh
elif [ $COMMAND = "help" ]; then
  echo "Help? Did you read the README file first? You should really do that. No really - do it. Now."
fi