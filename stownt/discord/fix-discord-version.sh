#!/bin/bash

# Default discord version
DEFAULT_VERSION="canary"

# Prompt / Get user input
echo "[Sript]: Update discord version"
read -p "Canary or Stable [C/s]: " choice
choice=${choice,,} # convert to lowercase
if [[ -z choice ]]; then
    choice=$DEFAULT_VERSION
fi

# Checking choice
if [[ "$choice" == "c" || "$choice" == "canary" ]]; then
    DISCORD_BUILD=/opt/discord-canary/resources/build_info.json
elif [[ "$choice" == "s" || "$choice" == "stable" ]]; then
    DISCORD_BUILD=/opt/discord/resources/build_info.json
else
    echo "Invalid choice. Exiting..."
    exit 1
fi

# Validate file existence
if [[ ! -f "$DISCORD_BUILD" ]]; then
    echo "Error: file does not exist: $DISCORD_BUILD"
    exit 1
fi

echo "Making changes to $DISCORD_BUILD"

# Get new version (regex validation)
while true; do
    read -p "Enter new version (format: 0.0.##(#)): " NEW_VERSION
    if [[ "$NEW_VERSION" =~ ^0\.0\.[0-9]{2,3}$ ]]; then
        break
    elif [[ "$NEW_VERSION" =~ ^exit$ ]]; then
        echo "Exiting..."
        exit 1
    else
        echo "Invalid format. (regex is: ^0\.0\.[0-9]{2,3}$)"
    fi
done

sudo sed -i "s/\"version\": \".*\"/\"version\": \"$NEW_VERSION\"/" "$DISCORD_BUILD"

echo "The following file has been updated: $DISCORD_BUILD"
