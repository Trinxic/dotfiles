#!/bin/bash

# Text Colors
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
RESET="\e[0m"

# find firefox file directory
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "${RED}MacOS Detected. Quitting...${RESET}"
    echo -e "${BLUE}NOTE: If you want to add firefox settings, checkout $HOME/dotfiles/stownt/firefox/${RESET}"
    # PROFILES_PATH="$HOME/Library/Application Support/Firefox"
else
    PROFILES_PATH="$HOME/.mozilla/firefox"
fi

# append file to path string (as new variable)
PROFILES_INI="$PROFILES_PATH/profiles.ini"

# verify path and file
if [[ ! -d "$PROFILES_PATH" || ! -f "$PROFILES_INI" ]]; then
    echo -e "${RED}Error finding profiles${RESET}"
    exit 1
fi

# get name of default profile
DEFAULT_PROFILE=$(awk -F= '/^Default=/ && $2 ~ /\./ {print $2}' "$PROFILES_INI")

# check if default profile exists within `profiles.ini`
if [[ -z "$DEFAULT_PROFILE" ]]; then
    echo -e "${RED}Error: could not find default profile${RESET}"
    exit 1
else
    DEFAULT_PROFILE="$PROFILES_PATH/$DEFAULT_PROFILE"
fi

# create sym-links
stow -t "$DEFAULT_PROFILE" -d "$HOME/dotfiles/stownt/firefox" .
