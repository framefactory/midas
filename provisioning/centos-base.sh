#!/bin/bash

# install epel repository
yum install -y epel-release

# system update
yum update -y

# development tools
yum groupinstall -y "Development Tools"
yum install -y wget vim bzip2
