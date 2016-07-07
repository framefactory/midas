#!/bin/bash
cat >> ~/.bash_profile << EOF
export LIGHT_DIR=$(pwd)

alias lightdir='cd ${LIGHT_DIR}'
alias lightup='cd ${LIGHT_DIR} && vagrant up --provider vmware_fusion && vagrant ssh'
alias lightssh='cd ${LIGHT_DIR} && vagrant ssh'
EOF

source ~/.bash_profile
