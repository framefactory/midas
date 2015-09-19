#!/bin/bash
cat >> ~/.bash_profile << EOF
export LIGHT_DIR=$(pwd)

alias lightdir='cd ${LIGHT_DIR}'
alias lightmount='cd ${LIGHT_DIR} && sshfs vagrant@127.0.0.1:/projects/ ./projects -p 2022 -o IdentityFile=.vagrant/machines/default/virtualbox/private_key,auto_cache,reconnect,defer_permissions,noappledouble,negative_vncache,volname=projects'
alias lightunmount='cd ${LIGHT_DIR} && fusermount -u projects'
alias lightup='cd ${LIGHT_DIR} && vagrant up && lightmount'
EOF

source ~/.bash_profile
