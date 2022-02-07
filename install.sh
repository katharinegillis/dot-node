#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" != "mac" ]; then
    # Set up repositories
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    curl -sL https://deb.nodesource.com/setup_"$NODE_SETUP_VERSION".x -o nodesource_setup.sh
    sudo bash nodesource_setup.sh
    rm -rf nodesource_setup.sh

    # Install node
    sudo apt install nodejs -y

    # Install yarn
    sudo apt install yarn -y
else
    # Set up
    brew install node@"$NODE_SETUP_VERSION"

    # Install yarn
    npm install -g corepack
fi