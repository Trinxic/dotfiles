#!/bin/bash

# --- Setup --- #
# Text Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
RESET="\033[0m"

# Directory containing scripts (or manually list them)
SCRIPT_DIR="$HOME/dotfiles/stownt/.setup"
SCRIPTS=("$SCRIPT_DIR"/*.sh)

# Script settings
set -o pipefail

# --- Script --- #
if [[ "$(uname)" == "Darwin" ]]; then
    RUN_BREW_SCRIPT=true
else
    RUN_BREW_SCRIPT=false
fi

# Parse arguments
for arg in "$@"; do
    case $arg in
        --no-brew)
            RUN_BREW_SCRIPT=false
            shift
            ;;
        --help|-h)
            echo -e "${GREEN}Usage: $0 [--no-brew] [--help]${RESET}"
            echo -e "${BLUE}Options:${RESET}"
            echo -e "  --no-brew    Skip running the brew script"
            echo -e "  --help, -h   Show this help message"
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${RESET}"
            exit 1
            ;;
    esac
done

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
    # ignore scripts with 'brew' in their name if --no-brew is set
    if [[ "$RUN_BREW_SCRIPT" == false && "$script" == *brew* ]]; then
        echo -e "${BLUE}Skipping:${RESET} ${script} (brew script not run)"
        continue
    fi

    echo -e "${BLUE}Running:${RESET} ${script}..."
    bash "$script" | indent_output || echo -e "${RED}Error:${RESET} ${script} ${RED}failed!${RESET}"
done

echo -e "${GREEN}All scripts completed${RESET}"
echo

# LAST STEP
cd "$HOME/dotfiles" || exit 1 # ensure pwd is ~/dotfiles
stow -D .         # remove symlinks
stow .            # re-apply symlinks
