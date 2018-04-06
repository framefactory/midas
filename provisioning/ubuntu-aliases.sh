#!/bin/bash

# Add bash aliases
cd ~
cat >> .bash_aliases << EOF
# Some user defined aliases
alias ll='ls -la'
alias ..='cd ..'

alias cdp='cd ~/projects'

alias editalias='vim ~/.bash_aliases'
alias sourcealias='source ~/.bashrc'
alias listalias='cat ~/.bash_aliases'
EOF
