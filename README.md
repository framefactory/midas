# Lightbox
Vagrant development box based on Centos 7 or Ubuntu.

## Create Vagrant base image for Lightbox

### Provider: VMware Fusion

#### Guest OS: Centos 7

##### Create Virtual Machine

*  Create custom virtual machine
*  Chose Linux > CentOS 64-bit
*  Create new virtual disk
*  Customize settings
*  Save as 'Lightbase'
*  Processors and memory: 2 cores, 2048 MB RAM
*  Hard Disk: 40 GB size, no split, no pre-allocation
*  Connect CD/DVD Drive and insert CentOS 7 Minimal Disk Image

##### Install Guest OS

*  Boot VM with Disk Image in CD/DVD Drive
*  Select 'Install CentOS 7'
*  Select language
*  Enable network
*  Select time zone
*  Disable KDump
*  Confirm installation destination
*  Software selection: minimal install
*  Set root password: vagrant, don't create user

##### Provisioning

* yum install -y git
* mkdir -p /tmp/provisioning && cd /tmp/provisioning
* git clone https://github.com/framelab/lightbox .


#### Guest OS: Ubuntu

### Provider: Virtualbox

#### Guest OS: Centos 7

#### Guest OS: Ubuntu