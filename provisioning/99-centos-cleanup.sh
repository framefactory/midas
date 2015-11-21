#!/bin/bash

# remove unused dependencies
yum autoremove -y

# zero out drive
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY