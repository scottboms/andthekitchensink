#!/usr/bin/env bash

#-------------------------------------------------------------------------------
# Base configuration and variables

set -o errexit
set -o nounset
set -o pipefail

if [[ "${TRACE-0}" == "1" ]];
  then set -o xtrace;
fi

COMMAND="$1"
HOME=$(pwd)
export PREFIX="/usr/local/custom"
export DIR=${HOME}/src
export ARCHFLAGS="-Os -arch x86_64 -fno-common"
export LC_CTYPE=en_US.UTF-8
export PATH="/usr/local/custom/bin:/usr/local/custom/sbin:$PATH"

#-------------------------------------------------------------------------------

if [[ "$#" -eq 0 ]]; then 
echo "-----------------------------------------------------------------------------
Please pass on of the following arguments to the script:\r\n
help          Print help information\r
download      Download all the included component source code\r
build         Will build all components in the 'packages' directory\r

For example: $ ./start.sh download
             $ sudo ./start.sh build
             $ enable debug by running TRACE=1 ./start.sh
-----------------------------------------------------------------------------"

elif [ $COMMAND = "download" ]; then
  echo ${DIR}
  mkdir -p ${DIR}
  cd ${DIR}
  sh ${HOME}/download-packages.sh
elif [ $COMMAND = "build" ]; then
  mkdir -p ${DIR}
  sh ${HOME}/build-packages.sh
elif [ $COMMAND = "help" ]; then
  echo "Help? Did you read the README file first? You should really do that. No really - do it. Now."
  exit
fi