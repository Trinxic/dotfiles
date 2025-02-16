#!/bin/bash

# find firefox file directory
if [[ "$OSTYPE" == "darwin"* ]]; then
    PROFILES_PATH="$HOME/Library/Application Support/Firefox"
else
    PROFILES_PATH="$HOME/.mozilla/firefox"
fi

# append file to path string (as new variable)
PROFILES_INI="$PROFILES_PATH/profiles.ini"

# verify path and file
if [[ ! -d "$PROFILES_PATH" || ! -f "$PROFILES_INI" ]]; then
    echo "Error finding profiles"
    exit 1
fi

# get name of default profile
DEFAULT_PROFILE=$(awk -F= '/^Default=/ && $2 ~ /\./ {print $2}' "$PROFILES_INI")

# check if default profile exists within `profiles.ini`
if [[ -z "$DEFAULT_PROFILE" ]]; then
    echo "Error: could not find default profile"
    exit 1
else
    DEFAULT_PROFILE="$PROFILES_PATH/$DEFAULT_PROFILE"
fi

# create sym-links
stow -t "$DEFAULT_PROFILE" -d "$HOME/dotfiles/stownt/firefox" .
