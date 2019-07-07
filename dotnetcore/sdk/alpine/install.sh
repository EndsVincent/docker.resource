#!/bin/bash

################################################################
#
#	alpine x64 install dotnet sdk 2.2.300
#
################################################################

set -ex

# please get the current url from microsoft website
DOTNET_SDK_URL="https://download.visualstudio.microsoft.com/download/pr/bcf3b2eb-a5ed-4829-b2c9-6fc5d41f79e2/30dfae04f6bb726fd763d52f0a42501a/dotnet-sdk-2.2.300-linux-musl-x64.tar.gz"
DOTNET_PATH="/usr/dotnet"

# install required tools
apk add icu

# install and  set path
wget mkdir -p /usr/dotnet \
	&& cd /usr/dotnet
	&& wget ${DOTNET_SDK_URL} \
	&& tar zxf dotnet-sdk-2.2.300-linux-musl-x64.tar.gz \
	&& rm dotnet-sdk-2.2.300-linux-musl-x64.tar.gz
	&& export DOTNET_ROOT=${DOTNET_PATH} \
	&& export PATH=$PATH:${DOTNET_PATH}
	
exit 0
