#!/bin/bash

# Text Colors
RED="\e[31m"
GREEN="\e[32m"
RESET="\e[0m"

# Detect kernal
if [[ "$(uname)" == "Darwin" ]]; then
    OS="mac"
elif [[ "$(uname)" == "Linux" ]]; then
    OS="linux"
else
    echo -e "${RED}Unsupported OS...${RESET}"
    exit 1
fi

# Input and output files
DOT_DIR="$HOME/dotfiles"
INPUT_FILE="$DOT_DIR/stownt/.setup/os-ignore.jsonc"
OUTPUT_FILE="$DOT_DIR/.stow-local-ignore"

# Check if input file exists
if [[ ! -f "$INPUT_FILE" ]]; then
    echo -e "${RED}Error: $INPUT_FILE not found!${RESET}"
    exit 1
fi

# Remove comments from the JSONC file before passing it to jq
CLEANED_JSON=$(sed 's/\(.*\)\s*\/\/.*$/\1/' "$INPUT_FILE" | sed 's/\\/\\\\/g' | jq .)

# Extract lines based on OS from the cleaned JSON
LINES_TO_APPEND=$(echo "$CLEANED_JSON" | jq -r --arg os "$OS" '.[$os] | .[]')

# Check if lines were found
if [[ -z "$LINES_TO_APPEND" ]]; then
    echo -e "${RED}No lines found for $OS in ${INPUT_FILE}.${RESET}"
    LINES_TO_APPEND=""
fi

# Initialize a marker to search for within $OUTPUT_FILE
HEADER="# --- Ignore Script --- #"

# Delete everything from "$HEADER" onward if it exists
if grep -q "$HEADER" "$OUTPUT_FILE"; then
    if [[ "$os" == "linux" ]]; then
        sed -i -e "/$HEADER/,\$d" "$OUTPUT_FILE" # remove empty string arg on Linux
    else
        sed -i '' -e "/$HEADER/,\$d" "$OUTPUT_FILE" # keep it on MacOS
    fi
fi

# Append the ignore script header and new lines
{
    echo "$HEADER"
    echo "$LINES_TO_APPEND"
} >>"$OUTPUT_FILE"

echo -e "${GREEN}Updated $OUTPUT_FILE with new ignore patterns.${RESET}"
