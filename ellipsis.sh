#!/usr/bin/env bash

pkg.link() {
    [ -d "$PKG_PATH/files" ] && fs.link_files $PKG_PATH/files
    [ -d "$PKG_PATH/bin" ] && fs.link_rfiles $PKG_PATH/bin $HOME/bin
}

pkg.install() {
    # Set up node
    bash $PKG_PATH/run.sh "$ELLIPSIS_SRC"
}

pkg.pull() {
    # Check for updates on git
    git remote update 2>&1 > /dev/null
    if git.is_behind; then
        # Unlink old files
        hooks.unlink

        # Pull changes from git
        git.pull

        # Link new files
        pkg.link
    fi

    # Set up node
    bash $PKG_PATH/run.sh "$ELLIPSIS_SRC"
}
