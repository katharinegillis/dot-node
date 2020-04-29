#!/usr/bin/env bash

pkg.link() {
    fs.link_files $PKG_PATH/files
}

pkg.install() {
    # Set up node
    bash $PKG_PATH/run.sh "$ELLIPSIS_SRC"
}

pkg.pull() {
    # Unlink old files
    hooks.unlink

    # Pull changes from git
    git.pull

    # Link new files
    pkg.link

    # Set up node
    bash $PKG_PATH/run.sh "$ELLIPSIS_SRC"
}
