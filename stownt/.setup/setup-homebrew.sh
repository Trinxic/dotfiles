#!/bin/bash

# Function to display messages
notify() {
    echo -e "\033[1;32m$1\033[0m" # Green text for notifications
}

# Detect kernal
if [[ "$(uname -s)" != "Darwin" ]]; then
    notify "MacOS not detected. Skipping Homebrew setup..."
    exit 1
else
    notify "MacOS detected. Setting up Homebrew..."
fi

# 1. Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    notify "Homebrew is not installed. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    notify "Homebrew installed successfully!"
else
    notify "Homebrew is already installed."
fi

# 2. Check if `homebrew/bundle` is installed
if ! brew tap | grep -q "^homebrew/bundle\$"; then
    notify "Homebrew Bundle is not installed. Installing now..."
    brew tap homebrew/bundle
    notify "Homebrew Bundle installed successfully!"
else
    notify "Homebrew Bundle is already installed."
fi

BREWFILE_PATH="$HOME/dotfiles/stownt/.setup/Brewfile"

# 3. Install missing apps from the Brewfile
if [[ -f "$BREWFILE_PATH" ]]; then
    notify "Checking $BREWFILE_PATH..."
    notify "Resolving any missing packages... All packages may have already be installed."
    brew bundle --file=$BREWFILE_PATH
else
    notify "Brewfile not found! Please create a Brewfile before running this script."
    exit 1
fi
