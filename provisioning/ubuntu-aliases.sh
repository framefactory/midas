#!/bin/bash

# Add bash aliases
cd /home/vagrant
cat >> .bash_aliases << EOF
alias ll='ls -la'
alias ..='cd ..'

alias cdp='cd ~/projects'

alias editalias='vim ~/.bash_aliases'
alias sourcealias='source ~/.bashrc'
alias listalias='cat ~/.bash_aliases'
EOF

source /home/vagrant/.bashrc
