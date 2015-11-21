#!/bin/bash

# VMware tools

# prerequisites
# 1. Insert VMware tools CD


mkdir -p /media/cdrom
mount /dev/sr0 /media/cdrom
pushd /media/cdrom
mkdir -p /tmp/vmware-tools
cp VMwareTools-* /tmp/vmware-tools
cd /tmp/vmware-tools
tar xzf VMwareTools-*
cd vmware-tools-distrib
./vmware-install.pl -d -f
popd

