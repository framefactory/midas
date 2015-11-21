#!/bin/bash

# VMware tools
#yum install -y open-vm-tools
#echo "answer AUTO_KMODS_ENABLED yes" | sudo tee -a /etc/vmware-tools/locations

mkdir -p /media/cdrom
mount /dev/sr0 /media/cdrom
cd /media/cdrom

# manual steps
# 1. Insert VMware tools CD
