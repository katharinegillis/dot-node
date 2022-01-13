#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" != "mac" ]; then
    # Set up repositories
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
    sudo bash nodesource_setup.sh
    rm -rf nodesource_setup.sh

    # Install node
    sudo apt install nodejs -y

    # Install yarn
    sudo apt install yarn -y
else
    # Set up to use nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

    nvm install "$NODE_VERSION"

    # Install yarn
    npm install -g corepack
fi