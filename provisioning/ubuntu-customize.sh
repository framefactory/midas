#!/bin/bash

# Add project folder
mkdir -p /home/vagrant/projects

# Add bash aliases
cd ~
cat >> .bash_aliases << EOF
# Some user defined aliases
alias ll='ls -la'
alias ..='cd ..'

alias cdp='cd ~/projects'
alias cdf='cd source/shared/flow'
alias pdf='pushd source/shared/flow'

alias editalias='vim ~/.bash_aliases'
alias sourcealias='source ~/.bashrc'
alias listalias='cat ~/.bash_aliases'
EOF
