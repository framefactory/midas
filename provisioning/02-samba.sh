#!/bin/bash

# install samba
sudo apt install -y samba

# add "vagrant" user with "vagrant" password
sudo -- sh -c '(echo "vagrant" && echo "vagrant") | smbpasswd -a vagrant'

# replace the samba configuration file
sudo -- sh -c 'cat > /etc/samba/smb.conf <<EOL
workgroup = Frame Factory
server string = Midas Ubuntu Server

security = user
map to guest = bad user
unix password sync = yes

[root]
    comment = Midas File System
    path = /
    browseable = yes
    guest ok = no
    read only = no
    create mask = 0755
    directory mask = 0755
EOL'

# restart services
sudo service smbd restart
sudo service nmbd restart
