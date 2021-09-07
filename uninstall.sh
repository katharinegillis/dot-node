#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" != "mac" ]; then
    # Remove node using apt
    sudo apt remove nodejs -y

    # Remove yarn using apt
    sudo apt remove yarn -y
fi