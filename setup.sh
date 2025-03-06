#!/bin/bash

# Text Colors
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
RESET="\e[0m"

# Directory containing scripts (or manually list them)
SCRIPT_DIR="$HOME/dotfiles/stownt/.setup"
SCRIPTS=("$SCRIPT_DIR"/*.sh)

# Check if scripts exist
if [ ! -d "$SCRIPT_DIR" ] || [ ${#SCRIPTS[@]} -eq 0 ]; then
    echo -e "${RED}No scripts found in ${SCRIPT_DIR}${RESET}"
    exit 1
fi

indent_output() {
    while IFS= read -r line; do
        echo "    $line"
    done
}

# Make scripts executable
for script in "${SCRIPTS[@]}"; do
    chmod +x "$script"
done

# Execute scripts and handle failures
for script in "${SCRIPTS[@]}"; do
    echo -e "${BLUE}Running:${RESET} ${script}..."
    "$script" | indent_output
    if [ $? -ne 0 ]; then
        echo -e "${RED}Error:${RESET} ${script} ${RED}failed!${RESET}"
    fi
done

echo -e "${GREEN}All scripts completed${RESET}"
echo

# LAST STEP
cd $HOME/dotfiles # ensure pwd is ~/dotfiles
stow -D .         # remove symlinks
stow .            # re-apply symlinks
