#!/bin/bash

# install samba
apt-get install -y samba

# add "vagrant" user with "vagrant" password
(echo "vagrant" && echo "vagrant") | smbpasswd -a vagrant

# write/replace the samba configuration file
pushd /etc/samba
cat > smb.conf <<EOL
workgroup = lightbox
server string = Lightbox Ubuntu Server

security = user
map to guest = bad user

[lightbox]
    comment = Lightbox File System
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