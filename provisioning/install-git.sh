#!/bin/bash

 # INSTALL AND BUILD LATEST VERSION OF GIT
 # ---------------------------------------

# Install dependencies
yum install -y perl-devel curl-devel expat-devel gettext-devel openssl-devel zlib-devel

GIT_VERSION=2.4.6

# fetch latest version of source code
mkdir /tmp/git
pushd /tmp/git
wget https://github.com/git/git/archive/v$GIT_VERSION.tar.gz

# compile and install
tar -zxf v$GIT_VERSION.tar.gz
cd git-$GIT_VERSION
make configure
./configure --prefix=/usr
make
make install

popd