#!/bin/bash

# install build essentials
apt-get install -y build-essential

# install git
#apt-add-repository ppa:git-core/ppa -y
#apt-get update
#apt-get install -y git

# install clang
apt-get install -y clang-6.0 lldb-6.0

# various tools
apt-get install -y cmake
apt-get install -y qt5-default qttools5-dev-tools
