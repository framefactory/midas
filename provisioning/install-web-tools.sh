#!/bin/bash

# SASS, Compass
yum install -y ruby ruby-devel rubygems
gem update --system
gem install sass
gem install compass


# Node.js
yum install -y nodejs npm
npm install -g requirejs nodemon forever