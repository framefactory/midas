#!/bin/bash
# INSTALL NODE.JS

# Install build essentials (required for NPM package compilation)
apt-get update && apt-get install -y build-essential libssl-dev python

# Install NVM (node version manager)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | NVM_DIR=/usr/local/nvm bash

# load NVM
export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add to vagrant's .bashrc
cat >> /home/vagrant/.bashrc <<EOL
export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
EOL

# install node.js
nvm install 8.11.1
nvm use 8.11.1
nvm alias default 8.11.1

# Check node versions
node --version
npm --version
