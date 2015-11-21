#!/bin/bash

NODE_VERSION=4.2.2

# fetch binaries
mkdir -p /tmp/nodejs
pushd /tmp/nodejs
wget https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz
tar --strip-components 1 -xzf node-v* -C /usr/local
popd
rm -rf /tmp/nodejs

# check version
node --version

# install packages
npm install -g requirejs nodemon forever bower grunt-cli http-server
