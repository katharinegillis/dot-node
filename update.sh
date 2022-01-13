#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" != "mac" ]; then
    # Update node using apt
    sudo apt install nodejs -y

    # Update yarn using apt
    sudo apt install yarn -y
else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

    npm update -g corepack
fi