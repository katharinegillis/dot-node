#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" != "mac" ]; then
    # Set up repositories
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    curl -sL https://deb.nodesource.com/setup_"$NODE_SETUP_VERSION" -o nodesource_setup.sh
    sudo bash nodesource_setup.sh
    rm -rf nodesource_setup.sh

    # Install node
    sudo apt install nodejs -y

    # Install yarn
    sudo apt install yarn -y
else
    # Set up
    curl "https://nodejs.org/dist/latest/node-${NODE_VERSION:-$(wget -qO- https://nodejs.org/dist/latest/ | sed -nE 's|.*>node-(.*)\.pkg</a>.*|\1|p')}.pkg" > "$HOME/Downloads/node-latest.pkg" && sudo installer -store -pkg "$HOME/Downloads/node-latest.pkg" -target "/"

    # Install yarn
    npm install -g corepack
fi