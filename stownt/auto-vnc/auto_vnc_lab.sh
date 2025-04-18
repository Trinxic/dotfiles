#!/bin/bash

# Get script directory
SRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get/Validate info-files and info
INFO_FILE="${SRIPT_DIR}/.info"
PASSWORD_FILE="${SRIPT_DIR}/.password.gpg"
if [ ! -f "${INFO_FILE}" ] || [ ! -f "${PASSWORD_FILE}" ]; then
    echo "Required info files not found."
    exit 1
fi

SSH_USERAME=$(grep '^username=' "${INFO_FILE}" | cut -d'=' -f2)
FRIENDLY_NAME=$(grep '^FriendlyName=' "${INFO_FILE}" | cut -d'=' -f2)
if [ -z "$SSH_USERAME" ] || [ -z "$FRIENDLY_NAME" ]; then
    echo "Username or FriendlyName not found in ${INFO_FILE}"
    exit 1
fi

# Get/Validate vnc shortcut file
VNC_FILE=""
for file in "$HOME/.vnc/ViewerStore/"*.vnc; do
    if grep -q "FriendlyName=${FRIENDLY_NAME}" "$file"; then
        VNC_FILE="$file"
        break
    fi
done
if [ -z "$VNC_FILE" ]; then
    echo "No VNC file found with FriendlyName=${FRIENDLY_NAME}"
    exit 1
fi

# Ensure gpg succeeded and password is not empty
PASSWORD=$(gpg --quiet --batch --no-tty --decrypt "${PASSWORD_FILE}" 2>/dev/null)
if [ $? -ne 0 ] || [ -z "$PASSWORD" ]; then
    echo "Failed to decrypt password. Ensure gpg is set up correctly."
    exit 1
fi

# Get 2FA code
while true; do
    read -rp "2FA code (ensure >20s remaining): " TFA_CODE
    if [[ "$TFA_CODE" =~ ^[0-9]{6}$ ]]; then
        break
    else
        echo "Invalid 2FA code. Please enter a 6-digit code."
    fi
done

# Run vncviewer after expect script executes (and in a new terminal)
kitty -e bash -c "sleep 10 && vncviewer $VNC_FILE" &

# Run expect script to handle SSH and VNC connection
expect $SRIPT_DIR/ssh_vnc.exp "$SSH_USERAME" "$PASSWORD" "$TFA_CODE"

# unset password for extra security
unset PASSWORD
