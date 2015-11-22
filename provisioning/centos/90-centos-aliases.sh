#!/bin/bash

cat >> /home/vagrant/.bashrc << EOF
alias ll='ls -la'
alias editalias='vim ~/.bashrc'
alias sourcealias='source ~/.bashrc'
alias listalias='cat ~/.bashrc'
EOF
