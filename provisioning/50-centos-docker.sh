#!/bin/bash

# install docker
chkconfig firewalld off
service firewalld stop
curl -sSL https://get.docker.com/ | sh
usermod -aG docker vagrant
service docker start

# install docker-compose
yum install -y python-pip
pip install -U docker-compose