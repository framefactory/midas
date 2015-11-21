#!/bin/bash

NODE_VERSION=4.2.2

# fetch binaries
mkdir -p /tmp/nodejs
cd /tmp/nodejs
wget https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz
tar xzvf node-v* && cd node-v*

# build
./configure
make
make install

# check version
node --version

# install NPM
yum install -y npm
