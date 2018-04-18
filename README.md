# Midas
Vagrant development box based on Ubuntu 64-bit Xenial 16.04.

## Required plugins
vagrant plugin install vagrant-disksize

## Installation

### 1. Clone project and build vagrant box
```
git clone https://github.com/framelab/midas .
vagrant plugin install vagrant-disksize
vagrant up
```
### 2. Private key for SSH connection
* Locate key in `.vagrant\machines\default\virtualbox\private_key`
* Convert key using PuTTYgen if necessary
* Configure PuTTY, load .ppk key file in SSH/Auth
* Test, connect to `10.0.0.10:2222`

### 3. Test web server
* Open a browser and navigate to 10.0.0.10

### 4. Samba file server
* Map network drive to `\\10.0.0.10\midas`
* User: vagrant, pass: vagrant