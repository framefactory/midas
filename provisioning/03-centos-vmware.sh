#!/bin/bash

# VMware tools

# prerequisites
# 1. Insert VMware tools CD

VMWARE_INSTALL_DIR=/tmp/vmware-tools-setup

mkdir -p /media/cdrom
mount /dev/sr0 /media/cdrom
pushd /media/cdrom
mkdir -p ${VMWARE_INSTALL_DIR}
cp VMwareTools-* ${VMWARE_INSTALL_DIR}
cd ${VMWARE_INSTALL_DIR}
tar xzf VMwareTools-*
cd vmware-tools-distrib
./vmware-install.pl -d -f
popd
rm -rf ${VMWARE_INSTALL_DIR}
