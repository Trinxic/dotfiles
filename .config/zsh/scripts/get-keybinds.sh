#!/bin/bash

# Ensure home directory
if [ -z ${HOME:-$USERPROFILE} ]; then
    echo "Could not determine the home directory"
    exit 1
fi

# Check if Python is installed
if ! command -v python3 &>/dev/null; then
    echo "Python is not installed. Must install Python before running this script"
    exit 1
fi

python3 ~/.config/zsh/scripts/get-keybinds.py
exit 0
