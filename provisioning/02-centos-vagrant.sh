#!/bin/bash

# Create user vagrant
groupadd -f vagrant
useradd vagrant -d /home/vagrant -g vagrant -G users

# install openssh
yum install -y openssh-server openssh-clients
 
# install the vagrant key
mkdir -p /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
wget --no-check-certificate \
    https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub \
    -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
 
# auto-start the service
systemctl enable sshd.service
systemctl start sshd.service

# create shared projects folder
cd /
mkdir -p projects
chown vagrant:vagrant projects