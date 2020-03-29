#!/usr/bin/env bash

pkg.install() {
    pkg.pull
}

pkg.pull() {
    echo -e "\e[32mUpdating node...\e[0m"

    docker pull node:lts

    fs.link_files $PKG_PATH/files

    echo -e "\e[32mDone node.\e[0m"
}
