#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    PROFILES_PATH="$HOME/Library/Application Support/Firefox"
else
    PROFILES_PATH="$HOME/.mozilla/firefox"
fi

PROFILES_INI="$PROFILES_PATH/profiles.ini"

if [[ ! -d "$PROFILES_PATH" || ! -f "$PROFILES_INI" ]]; then
    echo "Error finding profiles"
    exit 1
fi

DEFAULT_PROFILE=$(awk -F= '/^Default=/ && $2 ~ /\./ {print $2}' "$PROFILES_INI")

if [[ -z "$DEFAULT_PROFILE" ]]; then
    echo "Error: could not find default profile"
    exit 1
else
    DEFAULT_PROFILE="$PROFILES_PATH/$DEFAULT_PROFILE"
fi

stow -t "$DEFAULT_PROFILE" -d "$HOME/dotfiles/firefox" .
