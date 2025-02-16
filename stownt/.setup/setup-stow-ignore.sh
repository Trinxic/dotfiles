#!/bin/bash

# Detect OS
if [[ "$(uname)" == "Darwin" ]]; then
    OS="mac"
elif [[ "$(uname)" == "Linux" ]]; then
    OS="linux"
else
    echo "Unsupported OS"
    exit 1
fi

# Input and output files
INPUT_FILE="$HOME/dotfiles/.stow-local-ignore"           # Adjust as needed
OUTPUT_FILE="$HOME/dotfiles/stownt/.setup/os-ignore.txt" # Adjust as needed

# Check if input file exists
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: $INPUT_FILE not found!"
    exit 1
fi

# Extract lines based on OS
LINES_TO_APPEND=$(grep "^$OS:" "$INPUT_FILE" | cut -d':' -f2-)

# Check if lines were found
if [[ -z "$LINES_TO_APPEND" ]]; then
    echo "No lines found for $OS in $INPUT_FILE."
    exit 1
fi

# Append lines after "# ignore:" in the output file
if grep -q "# ignore:" "$OUTPUT_FILE"; then
    # Insert after the first occurrence of "# ignore:"
    sed -i "/# ignore:/a\\
$LINES_TO_APPEND" "$OUTPUT_FILE"
else
    echo "# ignore:" >>"$OUTPUT_FILE"
    echo "$LINES_TO_APPEND" >>"$OUTPUT_FILE"
fi

echo "Lines added to $OUTPUT_FILE."

"# --- Ignore Script --- #"
