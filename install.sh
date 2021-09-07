#!/usr/bin/env bash

# Set up repositories
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
rm -rf nodesource_setup.sh

# Install node
sudo apt install nodejs

# Install yarn
sudo apt install yarn