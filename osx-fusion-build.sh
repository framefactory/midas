#!/bin/bash

VMWARE_MACHINE_DIR=/Machines/VMware/Lightbase.vmwarevm

# prepare and package the box
pushd ${VMWARE_MACHINE_DIR}
rm -f *.plist
rm -f *.log

# defragment and compress the virtual disk file
/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager -d Virtual\ Disk.vmdk
/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager -k Virtual\ Disk.vmdk

# write metadata.json default file
cat > metadata.json << EOF
{
    "provider": "vmware_fusion"
}
EOF

# create box package
tar cvzf lightbase-vmware.box ./*
popd
mv -f ${VMWARE_MACHINE_DIR}/lightbase-vmware.box .

vagrant box remove lightbase-vmware.box
vagrant box add lightbase-vmware.box --name lightbase-vmware.box --provider vmware_fusion