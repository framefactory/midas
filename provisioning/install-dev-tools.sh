#!/bin/bash

# install build essentials
apt-get install -y build-essential

# install git
apt-add-repository ppa:git-core/ppa -y
apt-get update
apt-get install -y git

# install clang
apt-get install -y clang-3.6 lldb-3.6

# various tools
apt-get install -y cmake
