#!/bin/bash

# install samba
apt-get install -y samba

# add "vagrant" user with "vagrant" password
(echo "vagrant" && echo "vagrant") | smbpasswd -a vagrant

# write/replace the samba configuration file
pushd /etc/samba
cat > smb.conf <<EOL
workgroup = flowbox
server string = Flowbox Ubuntu Server

security = user
map to guest = bad user

[Flowbox]
    comment = Flowbox File System
    path = /
    browseable = yes
    guest ok = no
    read only = no
    create mask = 0755
    directory mask = 0755
EOL
popd

# restart services
service smbd restart
service nmbd restart