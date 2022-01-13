#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" != "mac" ]; then
    # Remove node using apt
    sudo apt remove nodejs -y

    # Remove yarn using apt
    sudo apt remove yarn -y
else
    source ~/.nvm/nvm.sh
    nvm deactivate
    for v in $(nvm_ls); do nvm uninstall $v; done
    rm -rf "$NVM_DIR"
fi