#!/bin/bash

# Apache, PHP, MySQL
DEBIAN_FRONTEND=noninteractive
apt-get install -y apache2 php5 mysql-server mysql-client
service apache2 restart

mysqladmin -u root password vagrant
#apt-get install -y phpmyadmin

# Node.js
apt-get install -y curl
curl -sL https://deb.nodesource.com/setup_0.12 | bash -
apt-get install -y nodejs
npm install -g requirejs nodemon forever

# SASS, Compass
apt-get install -y ruby ruby-dev
gem install sass
gem install compass

# Docker
curl -sSL https://get.docker.com/ | sh
usermod -aG docker vagrant