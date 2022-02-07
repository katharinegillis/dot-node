#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" != "mac" ]; then
    # Update node using apt
    sudo apt install nodejs -y

    # Update yarn using apt
    sudo apt install yarn -y
else
    brew update node@"$NODE_SETUP_VERSION"

    npm update -g corepack
fi