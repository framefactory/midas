#!/bin/bash

# install build essentials
sudo apt install -y build-essential

# install git
sudo apt-add-repository ppa:git-core/ppa -y
sudo apt update
sudo apt install -y git

# install clang
sudo apt install -y clang-8 lldb-8

# various tools
sudo apt install -y cmake
sudo apt install -y qt5-default qttools5-dev-tools
