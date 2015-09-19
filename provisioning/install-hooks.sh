#!/bin/bash

# create projects folder
cd /
mkdir -p projects
chown vagrant:vagrant projects

cd ~
cat > .bash_aliases << EOF
alias ll='ls -la'

alias editalias='vim ~/.bash_aliases'
alias sourcealias='source ~/.bashrc'
alias listalias='cat ~/.bash_aliases'
EOF

source ~/.bashrc