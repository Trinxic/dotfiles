#!/bin/bash

# Text Colors
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
RESET="\e[0m"

# Function to display messages
# notify() {
#     echo -e "\033[1;32m$1\033[0m" # Green text for notifications
# }

# Detect kernal
if [[ "$(uname -s)" != "Darwin" ]]; then
    echo -e "${RED}MacOS not detected. Skipping Homebrew setup...${RESET}"
    exit 1
else
    echo -e "${GREEN}MacOS detected. Setting up Homebrew...${RESET}"
fi

# 1. Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo -e "${BLUE}Homebrew is not installed. Installing now...${RESET}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo -e "${GREEN}Homebrew installed successfully!${RESET}"
else
    echo -e "${GREEN}Homebrew is already installed.${RESET}"
fi

# 2. Check if `homebrew/bundle` is installed
if ! brew tap | grep -q "^homebrew/bundle\$"; then
    echo -e "${BLUE}Homebrew Bundle is not installed. Installing now...${RESET}"
    brew tap homebrew/bundle
    echo -e "${GREEN}Homebrew Bundle installed successfully!${RESET}"
else
    echo -e "${BLUE}Homebrew Bundle is already installed.${RESET}"
fi

BREWFILE_PATH="$HOME/dotfiles/stownt/.setup/Brewfile"

# 3. Install missing apps from the Brewfile
if [[ -f "$BREWFILE_PATH" ]]; then
    echo -e "${BLUE}Checking $BREWFILE_PATH...${RESET}"
    echo -e "${BLUE}Resolving any missing packages... All packages may have already be installed.${RESET}"
    brew bundle --file=$BREWFILE_PATH
else
    echo -e "${RED}Brewfile not found! Please create a Brewfile before running this script.${RESET}"
    exit 1
fi

# Update packages
brew update && brew upgrade
