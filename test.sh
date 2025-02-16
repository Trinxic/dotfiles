#!/bin/bash

# Directory containing scripts (or manually list them)
SCRIPT_DIR="$HOME/dotfiles/stownt/setup"
SCRIPTS=("$SCRIPT_DIR"/*.sh) # Adjust pattern as needed

# Check if scripts exist
if [ ! -d "$SCRIPT_DIR" ] || [ ${#SCRIPTS[@]} -eq 0 ]; then
    echo "No scripts found in $SCRIPT_DIR"
    exit 1
fi

# Make scripts executable
for script in "${SCRIPTS[@]}"; do
    chmod +x "$script"
done

# Execute scripts and handle failures
for script in "${SCRIPTS[@]}"; do
    echo "$script"
    #if [ $? -ne 0 ]; then
    #    echo "Error: $script failed!"
    #fi
done

echo "All scripts attempted."
